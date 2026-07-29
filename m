Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA0241168B;
	Wed, 29 Jul 2026 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363615; cv=none; b=Bx6i3X7bsOf/a14fVFupJwCVnklIUD1J9eCZ1Y9Hl5ynYwwwJgyeqCO7WpL6FZ+0whSGhpWeQjuzef0kKoq/vJ5LICQiIv/UOU6ddJFKtjVXA7BRU1ICnx7Q5/4jfGAcxGhEgY99NqnA3ZX1vLptvebJfFLaFA7HE/1kQhZXjgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363615; c=relaxed/simple;
	bh=Vg/Sa6BiZ5tNiY5uYEO9CdMjbWIk/B2uK+qUHLJ0x8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3lr0dmKmCAJT9NgkAMs4qqE1F9eqy9bd1reiNRN8BoNXfqWdnlO9jExBraoTAX5O8Y7t/0dxXSBHzO2dwJdv3WhbQbyB2zoF+flm78QAzC+7ckgnSg4t9z+qYITaXmpJugcq7r8CGYO2PFtK+pnts70VHiX8gLDcrwlr02jm7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnN2rHKl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnN2rHKl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F50FC2BCB9;
	Wed, 29 Jul 2026 22:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785363615;
	bh=Vg/Sa6BiZ5tNiY5uYEO9CdMjbWIk/B2uK+qUHLJ0x8Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TnN2rHKlZ6yGC5GAOEI3do5TJsSZplBh7d75dVBkNHidlpZnmL93/365R0g0pCfLw
	 oJdKFaU8vGXTV+bbC9WSsmLmw/c6IPxu7h2TMEjUyTT3BUIGliesiFzufJvSLSJ5pq
	 x08WSfxq+YC+K9aqUuS8uyJl4yToe9hIsH5nQdOkj69JRsm0bVfDq6CJIhzmYohzHP
	 0o/xlXoZsX2hA5Ak+5xBFVlQKrCzjJwpDBo072Ar1t7MlKvsZAfNEtFvNfUTqX+tF8
	 V3rDzA6q4+fczyvyPDYuQwrXrbR9j/fcEnqfwKegZZifykh8TOG9L5YmKBgCQ6p5qi
	 OzUc+nYPvb5OQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DB6C53200;
	Wed, 29 Jul 2026 22:20:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 30 Jul 2026 00:20:12 +0200
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: dongwoon,dw9714: Document
 DW9714A and V variant
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-dw9714v-v2-1-d5da19e6c60b@ixit.cz>
References: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
In-Reply-To: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=q0K6E/Plbn+LUlzxJz5kdbAH/8vBaD17SvTrwnOusfY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqanydbQVqJUFtryrNmvezy16D4GoZ5BWCumOws
 pJg8w73H+uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCamp8nQAKCRBgAj/E00kg
 cuX/EACLduG3kV31Uo5ZqXNcRqOLtGXgyTyNIprhOAlUgMWYE9/ezecJFaP9ZmAlDJbdNzG2mLt
 b/VNw6bXRQmiLU6egwD8LiwOftvbGljav66N4/Rb1OBOoosDsb6jlRl5MdY0D7eWCdYffk05JjY
 d5RebGWppOxVEN6n7k3vYJbE3eDktmTkeRUfbIhGTPRATNmyvd2dJf8c3299QFWvv21aLyjX3Hv
 P5wjUn+rieN8sPZf9blZDSw+0hRp1lnePWMEGepLyvkxPVTMpeav+1ZaP0zGSG2/qejlb2D1LYe
 vjL8fX82XAzh8PRQOeSiD8zhEfkYuwRja8qNssdCxoikGZeKiWeZWqyE8VbSGt6HEsK8px+wU6V
 9IDP6LuKwj4QqJmTYOVFigkzepQbW429edJUR5P2TZP2zH6hqMmuh67sKT97buNMhXM4kP9i8FZ
 0Cl6WiBjtCfDGsAO8DguPslQ+1bb1OJw181iyvgn8CtWLaS5SYZUbDypb2e/9/7h2Eoj2teobdv
 lr9DDBEJB9qgXLkYv8um96xhEffHwtffjnqCFYdrv9SIsIn0gVye6AwD3+ac8uuf6am4OlOqAud
 wVHhpHWDPhIaxbMp/pZh4iXVR1GiswrCxhwiuw8CDYacpNjL+5vKp7Azj1OLrqcrSlBZXYbWi37
 t4+f/RhGP4/44xw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

DW9714A is successor of DW9714 and DW9714V is successor of the DW9714A.

All actuators are backward compatible, but they do introduce new features.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9714.yaml         | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
index 66229a3dc05d6..e8ad2d3448d5f 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
@@ -10,17 +10,25 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
   DW9174 is a 10-bit DAC with current sink capability. It is intended for
   driving voice coil lenses in camera modules.
 
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
2.53.0


