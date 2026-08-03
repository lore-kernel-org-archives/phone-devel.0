Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E836A377;
	Mon,  3 Aug 2026 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750628; cv=none; b=kLVGIf+7tLHcQDD7cv9qNhentDLXM6mjh9/XhfE3YQ11+Wo4kAVOpEXSQ5ErUL1K0RhoJIwKu4mRZGTgAF1YzZSGXw7Nft3tgU/WFJLnYlj2lwIYZ5xjQwMOasIysrBRViGojw3znYjKQo9tb/zRJEKWH5ePoENsKjyLk4Gpeek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750628; c=relaxed/simple;
	bh=8mY6AAs0bQLlQEslbcv/+yOPtvmhmNLEpSjQGIWWSjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tx7wgIob3n7mvlgw6/YWzmTkR1+1QdogZ0p4b3sesu6gyiOUL4peyY1i/Y7864XV7fVUrOFlL/K8Nnl7JNa2Rwt3Cst6/lIQK1zCcAOswA7m/Iq8FH+bh36gWSljK3zWJ7jQE2PZlvpOC5TNhXVMsZlQ2/KhrqFUtQCzzAaxr68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFqlNP8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFqlNP8t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E79FC2BCFA;
	Mon,  3 Aug 2026 09:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785750628;
	bh=8mY6AAs0bQLlQEslbcv/+yOPtvmhmNLEpSjQGIWWSjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aFqlNP8tZvLage5tV9LZgt2K2M+v1DLfi4a2bsQen2sBqAM6HI/v52NnCdTqb5ffe
	 wSAh0apRKgY44XJ54WMUWLXgx4GeW2hcUOHSG8I7xXekEV0w9pPq8AEh5YoT2THfqM
	 iiIpo2kl6QPtPOdLTGwzvlJw4W5iu4eFCq+fkrj/DOUS0IhGcc8GrhInfqwpFt3uls
	 OP+XStwcQ90G/2VJT6eSX6lgMzer1e6DogCjognSnD3rP0nEKueI2HlSxHkxHqBc5c
	 nECKMtMsj46ucb+8udrV2Kb7ZmOX6YZv2YLaySkANQanVNRE+EJkAarhP7r5sIp9Bz
	 1IqO1rChSv4qA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A93C55175;
	Mon,  3 Aug 2026 09:50:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 03 Aug 2026 11:50:25 +0200
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: dongwoon,dw9714: Document
 DW9714A and V variant
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dw9714v-v3-1-8e10278dcd0d@ixit.cz>
References: <20260803-dw9714v-v3-0-8e10278dcd0d@ixit.cz>
In-Reply-To: <20260803-dw9714v-v3-0-8e10278dcd0d@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=oVcaXqpDOcmHSgqIwupuG6hdi0uMYFAB5Ml2YkH3+nk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqcGRi5amBf5BMjN/Bz5MCOgoq1ms+Zcv0dvuYv
 WAc9xxBqLeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCanBkYgAKCRBgAj/E00kg
 ckH6D/0avCTu0ct8uzwpG+Ml0gfJMd/EzQDGcMcGTLVJFl6GIFzYokXj3rFpbkdJM+X9k14UTwu
 zbAKLKjXOCs3P9chD/3kFFUp+QZfUxfTspIU+hC6k9pkMCI9o7A3ZwRaZM7hbOedE7KBeqdjzsa
 Ormw4tX5IJ48EM4kELWM1rmIb7jvRlXGv/EuX22y9OwfJQHpPmnqbsxQTsjj6xBviF3kyu1KohN
 SQGI4RmL42mpG/7ysa5DJM1yeNSq/e5Nx4Grzsp3kF+8RKA0Jxj/sotkAY7H0FKAPrn3ZgzOwxM
 mAS0/lpa9HRQavcsC7P81VgVPyEnuX3ClL4eXVFtL+MpRR2XHjJjVKiKdYCMMGF/RXH2PCCWSM8
 3DxFosTFDMgy/+0ox4XxT1ke6fwFphbTRms7BqFS2cFQmJfJVMU3Vxz72SDfK+or+QWWluozn8f
 aVFIQ2qXfqKBABQscU6zV9YKDovEJEG1FompWDlDI5ZnzOZAF2YmbJ8FeRFh21PqoHGMGIahOzC
 pi4mz7BXUk7p/r0AbQhvoLbmjVBXAa6+Thv1USnGPvInNznNLHc+7nJrjTFil+Qiw+gV5aGYTTl
 8fwI2WnCi4On7F4ETHu/wNAVbJfqLOnMSrv9RnSeB5I04uEyrwHe3Jhn/qbB6CWPLByQe+XIOJq
 7pNFfZoR0ZucxVQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

DW9714A is successor of DW9714 and DW9714V is successor of the DW9714A.

All actuators are backward compatible, but they do introduce new features,
such as Smart Actuator Control (SAC) mode which can minimize the
mechanical vibration and achieve very fast mechanical settling time.
Support for SAC can be implemented in the future.

Nit: fix typo in description by removing duplicate information.

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


