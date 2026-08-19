Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37942D6E6C;
	Wed, 19 Aug 2026 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147349; cv=none; b=tiaWFZI+eQK20elpZ2/pZ36UnqrLLzsF+prVEqmMJdiVITxHOUozoygH57r7H1jsVIknYPsFUfR98F4U3ih0xM9oUPNVy5Dgq19chKuS4vDuw1Bhi4hKLvg/r0CR15yicueWxQj25sp6buTcPV1xRxBYgpfo8Cu+hBSS4jT9Tik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147349; c=relaxed/simple;
	bh=Qo1W8qYU8L8LZ7GvSNrPNsNmBCQ6COGvzQHSG3eAuI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PibeekxvSZKaKuMNq0v29FoJ0BVFbFWHttbd33sytymQVEsfvHfo/v0iQn3wZB638fGbOph8pjVOsCCbji++0MfitF0RV/wOFBTgiXIVrPZAhCN/ieccNpWzSynkjJ1r9wztTovxexKYtsPmFq0QIyllvqjV/nPQ/SRgaUpIE/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMyGGuvn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMyGGuvn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EE69C19425;
	Wed, 19 Aug 2026 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787147349;
	bh=Qo1W8qYU8L8LZ7GvSNrPNsNmBCQ6COGvzQHSG3eAuI4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SMyGGuvnCc6rkamsK+FDMr1wsmiD9dNibXlMsujlUoYzpZX15J6Rqu3DsFUznhTis
	 nESAHqZdnkAZXE5MLzHi4HplvJdDPhjf26qpf2bl87bp7ycqa2ojvyXPd8yt520gUV
	 mYe4Bl6uq7kCnLU4rPPNUngE8mA8fDfiWSMBVO0HHSdjkDFZHNjCWVQoRag2Czetqq
	 fSAT7jX5EY5akrum1oQSHarlTEGuddoPnjX7oNHicxwcMJ+wjcmiBWnAKJhRLdPNge
	 FrUMbhF0lvUkdp/F3QUmBVEwp4fAOcP6ZM54vBp/7R5xNDtIJu3efrpfxgvydqWBBA
	 KrlfWRHwmCU4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283A7C5DF6D;
	Wed, 19 Aug 2026 13:49:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Aug 2026 15:49:05 +0200
Subject: [PATCH v3] media: dt-bindings: dongwoon,dw9714: Fix example
 implying 1.8V
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-pp-pro-camera-v3-1-5b669a2ba899@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBAFf4X07JpuQSie/A/jobRF1kRpWmxQw
 r9L8aAx8TjJm3kTC9aTDWyfTczbSIH62wL5JmO6U7ezBTILM8FFySVHcA6c70Grq/UKFBYGVVv
 IXBu2OM7blsa1dzy9Odybi9VDiqRFR2Ho/WM9jJh2/9oRgUPVFKbmlZRt3R5opGGrnyyVo/hys
 f51BSBogeVOGJNLaT7uPM8vVYfb3fYAAAA=
X-Change-ID: 20260801-pp-pro-camera-a14d1af483cd
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=wXaWf0FZiUfHyVgUjQSi9vHdfwd5hd8hKQ6POghja+U=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqhbRUmxsSfnnRYEDqMfknoHRKdh0SwjhRtZZlG
 BFwOmYHASaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaoW0VAAKCRBgAj/E00kg
 cts/D/9sg86dS3xB86qmIQ3O20aL5UHA9BJBD8xzmXRwFizV4CTmRbIQBWftFo7NQLhqAYXEMus
 OhTcLfXFJklcofBG3i1A2IO/YdQ78PqhuHT/TJpyuk8AzihU8lnmikjNxWkx90MJNJ1gTlA4SvG
 S32Lk/jGWOmbR8qoqzbfA4YuYQMCm5hZpZkauKxuh+WZGGKDzVAD8p94z2zBNJEkirE2Fesa13v
 1ag3owZYsJ3aZ5V7te6mIFMeu4cTBE1lS3W7ptlUT/JyyrPixr0oVvhmhBFAxCwP72dXhnDBpGD
 FGm+LFHfX4h5mnbDTYF4VBSGEjaW3gE1ET9Rma+YdI3svPL61EeOqu3PsDCKQzasRBpZ+m/OJES
 g7THZCzvAGUhZ7RDp589uyiYPFBsyIwsWAUn5lItc9Qa48RBQgHIQTRlAi3Z96PQcnyf3CFW2Ua
 lU1dI7J6451CnsiCwqeAkFntIvY1uRmPaKOChdJ3FrF7jXPwn9wg9ffs0T9tvkJyvmgd4iCxi6I
 JYL3lC7wRdMW+qJQGt2Cg4GTUkAdElgRyNzXprBqqpigupqmIBZjmYfJhydAyEgPsoC69wr1E6/
 5ogTQaGAJxSB3B9XEmxuQjueKSkmZCYjImutOC4lzapo3SvihNaoBslPSAeIMADor36yh5jfLfS
 /IcjlZY0OUkwcww==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The datasheet says VDD should be between 2.3 to 4.3V, usually around
2.8V. Correct to prevent confusion and extend description.

Fixes: 2a96b40f366a ("media: dt-bindings: dongwoon,dw9714: convert to dtschema")
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
The example implies incorrect voltage, fix it.
---
Changes in v3:
- Missed Rob A-b.
- Link to v2: https://patch.msgid.link/20260819-pp-pro-camera-v2-1-c21652dd388d@ixit.cz

Changes in v2:
- Dropped the devices fixes, needs HW owners to address issues or
  document state to be understandable.
- Link to v1: https://patch.msgid.link/20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz
---
 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
index 66229a3dc05d6..7f5aa098351dc 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
@@ -20,28 +20,28 @@ properties:
   reg:
     maxItems: 1
 
   powerdown-gpios:
     description:
       XSD pin for shutdown (active low)
 
   vcc-supply:
-    description: VDD power supply
+    description: VDD power supply (2.3 to 4.3V)
 
 required:
   - compatible
   - reg
 
 additionalProperties: false
 
 examples:
   - |
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
 
         camera-lens@c {
             compatible = "dongwoon,dw9714";
             reg = <0x0c>;
-            vcc-supply = <&reg_csi_1v8>;
+            vcc-supply = <&reg_vcm_2v8>;
         };
     };

---
base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
change-id: 20260801-pp-pro-camera-a14d1af483cd

Best regards,
--  
David Heidelberg <david@ixit.cz>


