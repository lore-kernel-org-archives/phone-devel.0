Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F223AE187;
	Mon, 10 Aug 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357348; cv=none; b=ZjzqUm/R0+4amnwnpARBs61NcvoGYxH8sw4jlCXeeim5RzznFR1g/mMsCSIgdpAoyPkB3oYH7kRJZhHZUAOM2/KXb5bRs+OqnKxpBIj1AQukSlwJz6HXixUXbwPdnBwGwXJFHFsv0gCqudTeKz41ZERrABE7pDIcWwU7sn0vXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357348; c=relaxed/simple;
	bh=TrdLOVS+kkSe+xLM9w5zf9ng53kF2srwRIVlxkVKxM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USJ1+9Gkx96jvkhJbkEhnDKGDqxEYycoUZWI8SLnASTk+/4qxmuqvT5OK0r7qjBZjGQn82NxD8uer8OCPwtcp2HWU89tSeV4P2+8cotiQyjg/gX2T04sJSApUcGKEln8LUWAXsQ5fbvlhAkzPshG11+O91B8CDLJw9HcDWOwpJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+/RWk2T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+/RWk2T"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D977C2BCFA;
	Mon, 10 Aug 2026 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786357348;
	bh=TrdLOVS+kkSe+xLM9w5zf9ng53kF2srwRIVlxkVKxM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U+/RWk2TGPoDBQOCaZqDrWlMSivrjaPP9p9bza8f3nNeLIVCsDC/pH7EZecUrqKZj
	 Hq2cdwxrWpSt4QiAFj+cdLAA+q/0A9oBLtU21+m43B8LUNjJ69uxa3L89urRAPPhYd
	 KClPwAkLUM0VyQaoGHLxOazW/kdxKqekqwH1jSrn+mSviFTgeOBo3UV94V2KhzJhmU
	 oFzZvEfR5lLShLyfEnpeFvQ0KbPLPNvz0xY8TrkKVNn9GzDwML5QOxy4Fho1eqwX2G
	 pmRDDUz1NJt+prelCzN0aziNaN5fbDbmjXZnyCPmCvEHSoP+s8iNK6UwcIkZiWjlLy
	 gW6aI3mtpnfFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B03DC5AC82;
	Mon, 10 Aug 2026 10:22:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Aug 2026 12:22:23 +0200
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: dongwoon,dw9714: Document
 DW9714A and V variant
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-dw9714v-v4-1-a227cb1d29bd@ixit.cz>
References: <20260810-dw9714v-v4-0-a227cb1d29bd@ixit.cz>
In-Reply-To: <20260810-dw9714v-v4-0-a227cb1d29bd@ixit.cz>
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MctnB/YBUlKBkfY6HkmVWzrj67EeGRulizfUpQ/8RY4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqeaZiY2wzpx14SQkqY7LkwyJr/qFiF0WFREa+N
 bXeuGxzqwGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCanmmYgAKCRBgAj/E00kg
 chY6EACMnaTvgqtjk+E0ak15UnUP0edb3ducN4jJSU/4iSSp8OpafdurfkvV4tT6Bapr8anetMd
 XNsy5p2RaOGLa/FWnAOXk2qY1SvkYq7oHZQXEDAtWoljxBMNtxNDlEqi2V19uHH0dxlqA4NpuXI
 0fFaloefl8CeT50CWIgoUpRNzCeaV0CflVRLFfoEj4QsD70j2BOmEr0uFLgFuH3A7Wk4BtfFrId
 FwSdbh0bPjV4ULGT4GuAM+is5UQKiawq4Uji+3KULk6oXn8emrei7fUJoMqOzXm01sav4uFtU/u
 7nMquHij2/bDdlVrDArAhpLKTBjRC6QjbBP3JKx7P2f/r12xLyzxDcu6w8KuuVISEAMmp/w/2Pj
 mAlWJxN9Vlobx+mjEkul8whjbmjGUpkXSHOcjwYw1uzFl3Sf6QtvunHOU1vZst5xwT8nha08qIR
 pdWniUwG+In4NvbTKJ9GeeU6R33JGKDW8ZnWOGLZVmr4QkhUs6QiLhssXhqqGzsgbR9OGELjX2p
 lyQqOdKh/6tgd7XuCnW9e6cZz7wyhuVlmqI2grODdScXerruertJLsSpbscmRKH3F3UWUnFlFNu
 H6U01ODdK6BlOMjD0SEAkg0DsjNLk88Dwku7gcnkVP8MS6O566iD2CMyGVBSNd4LUYxv8iA2axn
 sV4Ek/IqJJPgRZA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

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


