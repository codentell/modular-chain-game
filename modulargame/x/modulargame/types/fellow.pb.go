// Code generated by protoc-gen-gogo. DO NOT EDIT.
// source: modulargame/modulargame/fellow.proto

package types

import (
	fmt "fmt"
	proto "github.com/gogo/protobuf/proto"
	io "io"
	math "math"
	math_bits "math/bits"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.GoGoProtoPackageIsVersion3 // please upgrade the proto package

type Fellow struct {
	Creator string `protobuf:"bytes,1,opt,name=creator,proto3" json:"creator,omitempty"`
	Id      uint64 `protobuf:"varint,2,opt,name=id,proto3" json:"id,omitempty"`
	Score   string `protobuf:"bytes,3,opt,name=score,proto3" json:"score,omitempty"`
	X       string `protobuf:"bytes,4,opt,name=x,proto3" json:"x,omitempty"`
	Y       string `protobuf:"bytes,5,opt,name=y,proto3" json:"y,omitempty"`
}

func (m *Fellow) Reset()         { *m = Fellow{} }
func (m *Fellow) String() string { return proto.CompactTextString(m) }
func (*Fellow) ProtoMessage()    {}
func (*Fellow) Descriptor() ([]byte, []int) {
	return fileDescriptor_570ec7d8760d7548, []int{0}
}
func (m *Fellow) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *Fellow) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_Fellow.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *Fellow) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Fellow.Merge(m, src)
}
func (m *Fellow) XXX_Size() int {
	return m.Size()
}
func (m *Fellow) XXX_DiscardUnknown() {
	xxx_messageInfo_Fellow.DiscardUnknown(m)
}

var xxx_messageInfo_Fellow proto.InternalMessageInfo

func (m *Fellow) GetCreator() string {
	if m != nil {
		return m.Creator
	}
	return ""
}

func (m *Fellow) GetId() uint64 {
	if m != nil {
		return m.Id
	}
	return 0
}

func (m *Fellow) GetScore() string {
	if m != nil {
		return m.Score
	}
	return ""
}

func (m *Fellow) GetX() string {
	if m != nil {
		return m.X
	}
	return ""
}

func (m *Fellow) GetY() string {
	if m != nil {
		return m.Y
	}
	return ""
}

func init() {
	proto.RegisterType((*Fellow)(nil), "modulargame.modulargame.Fellow")
}

func init() {
	proto.RegisterFile("modulargame/modulargame/fellow.proto", fileDescriptor_570ec7d8760d7548)
}

var fileDescriptor_570ec7d8760d7548 = []byte{
	// 180 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0xe2, 0x52, 0xc9, 0xcd, 0x4f, 0x29,
	0xcd, 0x49, 0x2c, 0x4a, 0x4f, 0xcc, 0x4d, 0xd5, 0x47, 0x66, 0xa7, 0xa5, 0xe6, 0xe4, 0xe4, 0x97,
	0xeb, 0x15, 0x14, 0xe5, 0x97, 0xe4, 0x0b, 0x89, 0x23, 0xc9, 0xe8, 0x21, 0xb1, 0x95, 0x52, 0xb8,
	0xd8, 0xdc, 0xc0, 0x0a, 0x85, 0x24, 0xb8, 0xd8, 0x93, 0x8b, 0x52, 0x13, 0x4b, 0xf2, 0x8b, 0x24,
	0x18, 0x15, 0x18, 0x35, 0x38, 0x83, 0x60, 0x5c, 0x21, 0x3e, 0x2e, 0xa6, 0xcc, 0x14, 0x09, 0x26,
	0x05, 0x46, 0x0d, 0x96, 0x20, 0xa6, 0xcc, 0x14, 0x21, 0x11, 0x2e, 0xd6, 0xe2, 0xe4, 0xfc, 0xa2,
	0x54, 0x09, 0x66, 0xb0, 0x3a, 0x08, 0x47, 0x88, 0x87, 0x8b, 0xb1, 0x42, 0x82, 0x05, 0x2c, 0xc2,
	0x58, 0x01, 0xe2, 0x55, 0x4a, 0xb0, 0x42, 0x78, 0x95, 0x4e, 0x96, 0x27, 0x1e, 0xc9, 0x31, 0x5e,
	0x78, 0x24, 0xc7, 0xf8, 0xe0, 0x91, 0x1c, 0xe3, 0x84, 0xc7, 0x72, 0x0c, 0x17, 0x1e, 0xcb, 0x31,
	0xdc, 0x78, 0x2c, 0xc7, 0x10, 0x25, 0x8f, 0xec, 0xe4, 0x0a, 0x14, 0x0f, 0x94, 0x54, 0x16, 0xa4,
	0x16, 0x27, 0xb1, 0x81, 0x3d, 0x60, 0x0c, 0x08, 0x00, 0x00, 0xff, 0xff, 0xfc, 0x70, 0x95, 0x18,
	0xe8, 0x00, 0x00, 0x00,
}

func (m *Fellow) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *Fellow) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *Fellow) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if len(m.Y) > 0 {
		i -= len(m.Y)
		copy(dAtA[i:], m.Y)
		i = encodeVarintFellow(dAtA, i, uint64(len(m.Y)))
		i--
		dAtA[i] = 0x2a
	}
	if len(m.X) > 0 {
		i -= len(m.X)
		copy(dAtA[i:], m.X)
		i = encodeVarintFellow(dAtA, i, uint64(len(m.X)))
		i--
		dAtA[i] = 0x22
	}
	if len(m.Score) > 0 {
		i -= len(m.Score)
		copy(dAtA[i:], m.Score)
		i = encodeVarintFellow(dAtA, i, uint64(len(m.Score)))
		i--
		dAtA[i] = 0x1a
	}
	if m.Id != 0 {
		i = encodeVarintFellow(dAtA, i, uint64(m.Id))
		i--
		dAtA[i] = 0x10
	}
	if len(m.Creator) > 0 {
		i -= len(m.Creator)
		copy(dAtA[i:], m.Creator)
		i = encodeVarintFellow(dAtA, i, uint64(len(m.Creator)))
		i--
		dAtA[i] = 0xa
	}
	return len(dAtA) - i, nil
}

func encodeVarintFellow(dAtA []byte, offset int, v uint64) int {
	offset -= sovFellow(v)
	base := offset
	for v >= 1<<7 {
		dAtA[offset] = uint8(v&0x7f | 0x80)
		v >>= 7
		offset++
	}
	dAtA[offset] = uint8(v)
	return base
}
func (m *Fellow) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	l = len(m.Creator)
	if l > 0 {
		n += 1 + l + sovFellow(uint64(l))
	}
	if m.Id != 0 {
		n += 1 + sovFellow(uint64(m.Id))
	}
	l = len(m.Score)
	if l > 0 {
		n += 1 + l + sovFellow(uint64(l))
	}
	l = len(m.X)
	if l > 0 {
		n += 1 + l + sovFellow(uint64(l))
	}
	l = len(m.Y)
	if l > 0 {
		n += 1 + l + sovFellow(uint64(l))
	}
	return n
}

func sovFellow(x uint64) (n int) {
	return (math_bits.Len64(x|1) + 6) / 7
}
func sozFellow(x uint64) (n int) {
	return sovFellow(uint64((x << 1) ^ uint64((int64(x) >> 63))))
}
func (m *Fellow) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowFellow
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: Fellow: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: Fellow: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Creator", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowFellow
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthFellow
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthFellow
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Creator = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 2:
			if wireType != 0 {
				return fmt.Errorf("proto: wrong wireType = %d for field Id", wireType)
			}
			m.Id = 0
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowFellow
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				m.Id |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
		case 3:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Score", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowFellow
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthFellow
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthFellow
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Score = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 4:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field X", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowFellow
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthFellow
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthFellow
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.X = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 5:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Y", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowFellow
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthFellow
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthFellow
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Y = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipFellow(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthFellow
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func skipFellow(dAtA []byte) (n int, err error) {
	l := len(dAtA)
	iNdEx := 0
	depth := 0
	for iNdEx < l {
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return 0, ErrIntOverflowFellow
			}
			if iNdEx >= l {
				return 0, io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		wireType := int(wire & 0x7)
		switch wireType {
		case 0:
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowFellow
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				iNdEx++
				if dAtA[iNdEx-1] < 0x80 {
					break
				}
			}
		case 1:
			iNdEx += 8
		case 2:
			var length int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowFellow
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				length |= (int(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if length < 0 {
				return 0, ErrInvalidLengthFellow
			}
			iNdEx += length
		case 3:
			depth++
		case 4:
			if depth == 0 {
				return 0, ErrUnexpectedEndOfGroupFellow
			}
			depth--
		case 5:
			iNdEx += 4
		default:
			return 0, fmt.Errorf("proto: illegal wireType %d", wireType)
		}
		if iNdEx < 0 {
			return 0, ErrInvalidLengthFellow
		}
		if depth == 0 {
			return iNdEx, nil
		}
	}
	return 0, io.ErrUnexpectedEOF
}

var (
	ErrInvalidLengthFellow        = fmt.Errorf("proto: negative length found during unmarshaling")
	ErrIntOverflowFellow          = fmt.Errorf("proto: integer overflow")
	ErrUnexpectedEndOfGroupFellow = fmt.Errorf("proto: unexpected end of group")
)