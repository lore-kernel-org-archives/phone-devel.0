Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6AF25B099;
	Sat, 22 Aug 2026 05:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787375744; cv=none; b=RswxtLJ3jTMNsdFU4VgFRX70yPNIUoxZ07/hkrmppbQ0JGQV04sOHWuWiYAKCh8sB25zUu+5/ECz6alRjIKM8rb1kyCuXC5hweSSKwTmU/7ogOZtPmhTqBE4DJT3cbBgHu1F4h14MFHCGKYMLoTcwiVrFPoJzCN/XLc1wvoxLPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787375744; c=relaxed/simple;
	bh=TrdLOVS+kkSe+xLM9w5zf9ng53kF2srwRIVlxkVKxM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uvzc4BIXare8xmZzGBmv3M8v9YDl0R/U3hU0F4yRfe8MiOPyy/bI6il2aqOGjRg12lkn3rtQz+32dwVqM8U0jzGEOozMYf8Zihw+tz3sDyvj2QU968ikv50oC986S6LY7fua+7OYEx3+xwxDFgV3ylOSTZS7I9DLko+bipMkf28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pr7VoOG/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pr7VoOG/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D3BAC2BCF6;
	Sat, 22 Aug 2026 05:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787375743;
	bh=TrdLOVS+kkSe+xLM9w5zf9ng53kF2srwRIVlxkVKxM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Pr7VoOG/lWHvnorq6lBHfL6E75q3fInpocu427fM+AfSyvZ9GmpxoMeOdZb/DgFWe
	 vOaK0CRnm87sroWqilFST+4WSn1p6tAo+niYlMk4xjdtOTVSwSK2oj/FiwBrb4R71D
	 JOg/NLfHfvecV8Oqk6DUnQP9Bfz5m72I/zbL9duj2MtaaeOrEMu4M0hn2Cyj17NYJs
	 SEX9Mgw2YnaFnjZl72seIWgfXfNf6bx1klfo3mdSRzEmOA0c40An4/Z8Au2/07dbRr
	 ZcdujToeVCdQPKm74uhAdjvbik5pf8MerQnDczp6Z8zPedhWLoKDyKdXt8Tk0o9E1O
	 vmt1KNBeC4sUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C00DC5DF8C;
	Sat, 22 Aug 2026 05:15:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 22 Aug 2026 07:15:16 +0200
Subject: [PATCH v5 1/3] dt-bindings: media: i2c: dongwoon,dw9714: Document
 DW9714A and V variant
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-dw9714v-v5-1-502bc7f43b8f@ixit.cz>
References: <20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz>
In-Reply-To: <20260822-dw9714v-v5-0-502bc7f43b8f@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqiTB9j6/jFLwCxqgYxpUH8LT2DL2zrUTvujR2N
 Tabh7AIxweJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaokwfQAKCRBgAj/E00kg
 cvQyD/9xiCxwFXfRvXj4cqKxdIirjmF73HdbonOQJN/aQQhoCDpLx1vIeV0GALyCQlAtJUpx+wL
 BXKHCteBgM9lnzKdoBr7z3uTKlOxiNORXh4b6Low1s9yM+DLM892ew1eS9HXOiEH7+srYuTwVnH
 6h1S6WJkMse4qeo5sQ5UOHRIiuhthaEOMCHFv8sFjJ9y9BpAeg1f3cBvmb3IuWxJylYMn/e/e8A
 Xvq0KfQ7jZLDHFpL/6WiiSWWSiqBX5ePKXf3Aq5vX5N+wWtEzO8ofRT0WQGgIYIuGeYUEUX/i3F
 YMZoTTM5uipANkKgsZrfKq9jUT0ZRtpKcYxFEBZM9/0UxokfswGXvwznmp0aPPEVcXXi+C8sUB3
 yYWW7WnoXeRzRH53A7juUuP6eCJKbF6Bm9Ez4QRr5qm0q3DbGcQz28MWw0iPRIiP0dvUL0OEHsV
 MXEQkJ/nTIyWZoige7DKcKaSkan+EM4YDv6zuC5YQB/T+geNVxA1O+/4AGNbsxnUpz3oqrIF6e9
 83WOOJhui8USKTUF9yp3tpkdeIeyXRJ29u7rjynSHwR4XuMMBx+1LhyM6ElQobFdfPRekPBdt/p
 ELhwbYlxkVdP6CIDjWo2U7YV0NLecGZw54vjxbHeua1icupQReMD0pe++TmZGDjmJwVEscKkpxH
 5T2n1lehH3Ax/ZQ==
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


