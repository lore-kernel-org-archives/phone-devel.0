Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019093;
	b=dZn9U0/T/4dCjs9JbT7gAQ92kMd8JltStzW/YZFUsQIxp432Vwf6yWopmD7DbCoJoS+N
	 zTYpTubSwKprCGjSYn5mrfcutlNz/fVP014yrZq8ml+QLCZqKYCelM5W4IbpotVpUXmp2
	 POcz7OjwhRZaopsRGYetQMXVOUT9ZWHKCM62ETORjyk0Cwdg6X+GprDKtOdb75O/nsu5Z
	 RZsHrCzqD1CbIVmRmKQIj2qrRWMFeGJNK/ZypKJX6+TjK9NqNOVgspJz/UhWdxiGHZ118
	 kCuZgp7grHIrx9FoEImTD3z+F6KgUVINE/FySE5IXY0ujInf6QVidC9OT+3dbEDLQEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019093;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sAap6/oLo209oGEQs/2vMifUGcUqmldYQ/uCZjY/EzA=;
	b=eMG4LpHNErZ6drheHPING97Z1hjOy0m5gYTV1DonANWJeAFpjiiU93OeFkZi8JSq8ihv
	 acYBKhBxyKXiy4j4+U9k1IaioiWySdeIp3qw6fWWdhLJi/k191HKHFquSy5O2Q8WWBHgq
	 2n0HhgbJgZJRYH6Qcb08IIqC7Yo471ahcBYG4oUT6HANqkV4oH/O9e38nFncEsbf2116W
	 tWk19TeiprYWNPRjcVMv5A4YHHxjqzvCmKE+/8MkXflCCTcs86ue8GnyUp9yA0u4u5KS1
	 wTMzsaLV9aFtP+AxAnq6x+3o+wkgQoRtoIscTtxVdW5rHb7alN1bQeAQunDN+Qso2Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDUfJXy6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A396606A333;
	Wed, 18 Nov 2026 16:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDUfJXy6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795019093;
	b=GH001fVZqfTQwm/PqKoy01JpkwmrOvwnas+6ohdrnEvxyjxYdm4glivw1N+21FaFNIFB
	 nH256JqfcXWt/CY+CymtUpLzu9YiyM5FoSXPBO1Ir+B4FxZJUnHHZndXwU0ntUUrHSP/z
	 quEX7ZqWjtRgKPGGYJn/hMowCsrpgRizMwwDU7wp5IT/IuZgGHxh/U7+Aq9mff3ZaTYsD
	 IZCexKHrctbOBjbHfW7ZgmsG1pXxXq4zFKH0ZwweIlsUl0e/oUtAwQ+j3Cdwu6Q0LYaKA
	 Q0wQJ14pHDoa5eACyBxaIc3D1B8Yisxo0If+HtmVjgHBvsdeOqEGL/OMl0JHk3uCWZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795019093;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sAap6/oLo209oGEQs/2vMifUGcUqmldYQ/uCZjY/EzA=;
	b=pdtShhr6DyAh4EApZO2mw1eaJWF519kPeG8y6/8fyrViRX910HYxtgVteAbsWuSfb37L
	 eP8Eyk5eUZY9ugfUf62JaAl+e2ztu6qXOX3cKgCWdzMLqiR5rJ9B+HQCdri1DAZ9fpQM3
	 ex8DR1ABzXgm/jFIf/l8mPGwL7S1F7uQ3FSYJHkVMA/zFjzLQsXpOZ/e5P2NMaR8Rgsal
	 p+8P4O/qsy8QtUjn6Igb9kSUXN2O+ojBcKjwLgsgv3LIqaAOODs1n4/HwHQxqhXT7pYRn
	 G9bWnrflL0FQnTeB+wVX6G76/vELSv1yasa5BKSRZZ1BUYrdgVZIEayFO2gIJVeUskg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A2A21F000C4;
	Wed, 18 Nov 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019093;
	bh=sAap6/oLo209oGEQs/2vMifUGcUqmldYQ/uCZjY/EzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZDUfJXy6U9xamxBjVtjeVQOjHZt8w41C36FKeIb+QhNTv7OwSSVuLi9v4MhRXTP2u
	 qhq6NUWT86fBTw1Na993H7cuHffEf8OqgrTW1tk3WPGXBZ4RpPzyjTaKSDXjjtCMyh
	 hgbVgPIyIeHiSV56xuULjjiQhDnsMyFhprC/rboOy3uy1QQr6ZcKPd5bXA4VhCRlDV
	 DA2BZ1iSymvSs0mzT55j0mJbI4WFEoVUkzoDgVL1VlENqaskU2N8HU0XkQKvc0sn9d
	 6+TyJfpQEHnxFe+7LWtdDDLDNNEAKETWUFUi0EiA2Pi/yYzK/73XNa/6mp1H3ejXnT
	 NwEJLC9/bflDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8CE8A4AE26;
	Wed, 18 Nov 2026 16:24:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 18 Nov 2026 17:23:56 +0100
Subject: [PATCH RESEND v6 1/3] dt-bindings: media: i2c: dongwoon,dw9714:
 Document DW9714A and V variant
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-dw9714v-v6-1-48cfd8ee4c4c@ixit.cz>
References: <20261118-dw9714v-v6-0-48cfd8ee4c4c@ixit.cz>
In-Reply-To: <20261118-dw9714v-v6-0-48cfd8ee4c4c@ixit.cz>
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MctnB/YBUlKBkfY6HkmVWzrj67EeGRulizfUpQ/8RY4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq/dFSfbanzBkVKEUdzbIRWUm26RyYZMeX/trR9
 fWxIc3JZ6SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCav3RUgAKCRBgAj/E00kg
 cu43D/wM3kahxulqMtdpQMfZlethaBetxXfjD1Rudb0vrDeQajTyb9okO8MeqEjgSa0JkTkw/TX
 Tydpf++oqQ4zp8XlU4X2v3/pLz3iGzxLomNX2wEuOWpAQK4pY6ZN0SrL5x0RJY6c3FoiSttfp24
 O2413uemhzLGTFcypS2jpwksl3GJuc4SDVygIrd4ucARmV77eNqL5mDIadMaRXtTfbMPpXKwFTh
 tF0EALpBUvUmz/nbK23GblqSQIFkN+pNG+5JIegRCzO8abgUQTrvdGjB9epNdRvzhVxt0xw5vKK
 eGoq/ACHq3j6xdMlnd49ET77C6XG8pUyF1KFnECsx91zssENgXG4OifPlruhRKYGgvEbW8017Ph
 7RckOpob7/DAUSmgrwatw27DwX3Tk3yVl3iD6vMg6nRgoxbUiAlFNK153sN93qxSB6w3EqEJpvq
 PG4r69F+QK/AgqshE2TTLO+BP+Z117R8h9PwCgKbN0fECV1jODJFKzDDexxtU+JOrMNtGtE5kqb
 8ETGCe7sd6cp0uyHRhzc5p60/X3RHoqMS7A45fwS7bGBSyr4nUF/j5mRX22vMAsSy3BOzr/vAK+
 xi4C/Wz/+TEpvRpnwMv8Y5opwtFYipdW333vi12DzkO8kQtX6lFzQeb2mFFQvLSAioU0c8yK+pi
 mwy4n7R0rjgjo8A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

DW9714A is a successor of DW9714 and DW9714V is a successor of DW9714A.

All three are compatible in their normal mode: a 10-bit DAC with the same
Direct/LSC/DLC slew rate control. DW9714V additionally has an "advanced
mode", which exposes Smart Actuator Control (SAC2/SAC3/SAC3.5/SLSC) and
soft start/landing. Out of reset the DW9714V comes up in normal mode
with ringing control disabled, i.e. behaving as a plain DW9714,
so nothing has to be configured for it to work today.

Should SAC support be added later, it is board data rather than a userspace
knob: the mode and the vibration period (SAC_CFG/PRESC/SACT) have to match
the mechanical tVIB of the actuator and lens assembly of the given camera
module. Those properties are left out until there is driver support and
measured values.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9714.yaml     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
index 66229a3dc05d6..7c2769e6c4880 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
@@ -5,22 +5,30 @@ $id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Dongwoon Anatech DW9714 camera voice coil lens driver
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
-  DW9174 is a 10-bit DAC with current sink capability. It is intended for
-  driving voice coil lenses in camera modules.
+  10-bit DAC with current sink capability. It is intended for driving
+  voice coil lenses in camera modules.
 
 properties:
   compatible:
-    const: dongwoon,dw9714
+    oneOf:
+      - items:
+          - const: dongwoon,dw9714v
+          - const: dongwoon,dw9714a
+          - const: dongwoon,dw9714
+      - items:
+          - const: dongwoon,dw9714a
+          - const: dongwoon,dw9714
+      - const: dongwoon,dw9714
 
   reg:
     maxItems: 1
 
   powerdown-gpios:
     description:
       XSD pin for shutdown (active low)
 

-- 
2.55.0


