Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A38476698;
	Wed, 19 Aug 2026 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147218; cv=none; b=tNdWd2qFRHrJRLSyR3YhxDmvQbdfpMekBZgeMi3AWgK+K+MgLNxeGhOV6vEHaxvJAy8hce8EBTx3Cg9A949cfWReKhrBRTRI3Mad7vYNJrX0laTWlaVKEbAT8yCPxXaldXqpdwIEE4OynQeRwYBqSAatD4+eQudi+k4SUZH9hvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147218; c=relaxed/simple;
	bh=/0vGNRVy55jyan4zG8BD8bNkuBbvTvizL2WnMPepYBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ehXPXjKurYJDjPl2X/rEz7s7WPpEvmpT/xhKcGam3UzzkIaXBrDHZfeQyc2UTF6em7p1YLLJh7UY7s8ogDZI0MMQP4fUwfRVjYDwuRoxcOK+3QsXsPfMz5GsoGqRcswMIo5m0/10NNIecOPkhi187PIlXWxj4PySeBBirgTKNpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6RZIHd2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6RZIHd2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EAFDC19425;
	Wed, 19 Aug 2026 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787147217;
	bh=/0vGNRVy55jyan4zG8BD8bNkuBbvTvizL2WnMPepYBs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=q6RZIHd2f5B5hH6L/eo9pIacsSI2MjLKUAW847UWH/OzQuInVYIa1+lIr6c/EImbH
	 eT1zioenhLpMNsjbJtp6gHPOJt4fCQ44qmdZwlKLud4/Hc8tBcqwfn3K6dSe97FjP+
	 AvhlcGlhMjzYyC1D5RRZxbf2SoeGsCU/1myX8nT9Q4SF+UVI0yB2DY4a/TvGBCKXTU
	 veBggsxRBTkOewrxHojQUmagcQll3de7ESljxEjfwt+GTPWhdj1LhdjnqriFmEhPcZ
	 Hla8U3Jld0Zv7QI/O6obA7moCKGIHHK9jmLpq1mgFab4/gJ3Rllv+0A56B85n4IEuD
	 h+HOPJ/AYZcYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D63C5B572;
	Wed, 19 Aug 2026 13:46:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Aug 2026 15:46:54 +0200
Subject: [PATCH v2] media: dt-bindings: dongwoon,dw9714: Fix example
 implying 1.8V
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-pp-pro-camera-v2-1-c21652dd388d@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZgWiRRX3sOwKO1UxkRoWiQo4
 e62uHb5kvffXyFSYIpwKVYINHPkcUhQHgowvR7uhGwTQynKs1BCovfow4hGPylo1LKyUrtKnYy
 FtPGBHC9779b+OL66B5kpR7LRc5zG8N4PZ5m9f+1ZosC6q2wjaqVc46688HQ0H2i3bfsCrLFtn
 LoAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1798; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=WEz/pz57pQGwTSB/NZ0X/QE1xaXHsRApbxIBxFTqjKk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqhbPQMqzPiKbvO2zm5Y25Q1FChZvbD4ycOMRlw
 qreCnstAv2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaoWz0AAKCRBgAj/E00kg
 cph7EADFujxDmvz4QUJ/nDfMlv+cHBpuMmsb3VBF0efv/N5Tj3rbzfRnVtu1y9h0iztGRpf7dIt
 MMnY9s6dLeTqG2H7dKN601hn6ZQkHsYTnXutP8cJR6FoED2GSczi3cSDTt/kCNi5+71dTdktqGb
 IwzlRcZxGoXid2bNtWvI3rnhLJZoQX03ntlkRgPndYL/R1gqf0PG37VLfMLiiw2qmy+4gt+Os5W
 xU/hxWjng309iYlTNMU9emVVe97I/WpzBDAWjOMifN1WbjAnFnSg2IhfryhQpggzXPR3NJMFxr0
 MCFGNc4zpPZjzKLPtVDTAYzOd1pxJc6Jms1BJ70oNPlI5ma3MITPI/Wpb8OFOHzb4j7Wriszj0e
 2QkZ1ibo7YTTqD08nhR7cWar460VUFIs8DGiWf9wtE4mFSgVObGoan60TAm3bO4r5Bn5HpzXtIk
 eJAE9zzzrxwOny8mgdUZYx0iHrn2LdckM8E0pbkNso3BrIL1shh0xc/fbHL3jWTeAoSFkePyIeF
 MG/glKm26c2NLMD7AxHG2HZUE5PbjbDSSVZxia+uHDCdxHxvCtzNY+GzAem5MuFQm1zedYHADID
 KOpLOjhw9YX9ozE9NyhBPVvQuEt6d7y2SNRTRX3rJGulYHzm8rcnBN2lq7tKXh3bCbQQTgAzLuX
 eOXKIeFIFCKYqsA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The datasheet says VDD should be between 2.3 to 4.3V, usually around
2.8V. Correct to prevent confusion and extend description.

Fixes: 2a96b40f366a ("media: dt-bindings: dongwoon,dw9714: convert to dtschema")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
The example implies incorrect voltage, fix it.
---
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


