Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D93515EE;
	Thu, 23 Jul 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818500; cv=none; b=j5ov0Uh94kGSyVw7WPg9eVehyw9FyKCVPARPNJQaX9paYoTgX/J11Y8NXo+xE1zF7nuBX++I6wpiUwx3/vuRzjVuk8XBTup10JfUBGpPKz0hL0xWiBDSc+3wIycDMJtPvWsFmPfeNDYg36sc/6bso0LzHYt51JS3p/TLcdi6nYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818500; c=relaxed/simple;
	bh=nMUYGZpaXyhjmpdHbYasVJteunM+yLVa2mhegOepmm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Itt3JMQNeNHdKt/Vjov+WieaBNdApqXhm//0xJtOaP/7D3+8YKwRatKJpsgNwWgJmF/FwV55LoY60OEikWjj2ibCV/Irozsbu/rFUMwUFFT03eQFF4KkEEKNPqY3lzXqZ3tEWlYSm2bNUgXkXOuQh7voxuJqDRktm2MJJBla6Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEzC6xTH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEzC6xTH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3274C2BCC9;
	Thu, 23 Jul 2026 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784818499;
	bh=nMUYGZpaXyhjmpdHbYasVJteunM+yLVa2mhegOepmm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SEzC6xTHmLgi4o5ln2tTUr2C6fmfyJqSYGhlbClJwmCrka9tdjWbe8S4dmMFAOdBw
	 cyaPaIA6KtRn1IjJYSO+q5mjVunWCSqI/syM983SywzrD9XTmRDdzpQWFtOUDt8PW1
	 lTLY5ivy4AEkWyzCXHAZuXxh03OHOXfj/43gem9AWZJBKcOSE3AWXK6xkDZP2v4KV7
	 r5dx17upfE2vZt7S/bV15l+Jh/vAGDDnlz4CRp3VM82lQ3rYdptHkygN1vAmnfrcfQ
	 5uoNWdxr+3320nkaZEiSMb6SqNtKyAsHliRT6jq99Q8yOX7c4ZhLXdcPdnKoVPsw0v
	 LyreKndDfk0OQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9277FC531F7;
	Thu, 23 Jul 2026 14:54:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Thu, 23 Jul 2026 10:53:52 -0400
Subject: [PATCH 1/2] regulator: dt-bindings: qcom,rpmh: Add support for
 PM8350B
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-pm8350b-ldo-v1-1-42b5428a0d3f@proton.me>
References: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
In-Reply-To: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784818498; l=1661;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=LdzXIMsptuIjQd8m41gLdX8Sp15lL0imXwUrErODm0o=;
 b=g2TsnYFqdpkODkHzPse5iQVKHcMZ7aNZ6Yw3ZOEWvHECg0X24SITN3F9+PSkAUfiNZ59PYlXN
 4fl72+kxXr6B74kdTAOz00IkynKSaop/83cD0MjiuvUAuv4U9Kk9VJB
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

The PM8350B has only one LDO, which gets its power from a dedicated input.
Add support for it.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index d93594304651..eed2ce7fa861 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -47,6 +47,7 @@ description: |
       For PM8150, smps1 - smps10, ldo1 - ldo18
       For PM8150L, smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
       For PM8350, smps1 - smps12, ldo1 - ldo10
+      For PM8350B, ldo1
       For PM8350C, smps1 - smps10, ldo1 - ldo13, bob
       For PM8450, smps1 - smps6, ldo1 - ldo4
       For PM8550, smps1 - smps6, ldo1 - ldo17, bob1 - bob2
@@ -82,6 +83,7 @@ properties:
       - qcom,pm8150-rpmh-regulators
       - qcom,pm8150l-rpmh-regulators
       - qcom,pm8350-rpmh-regulators
+      - qcom,pm8350b-rpmh-regulators
       - qcom,pm8350c-rpmh-regulators
       - qcom,pm8450-rpmh-regulators
       - qcom,pm8550-rpmh-regulators
@@ -337,6 +339,15 @@ allOf:
       patternProperties:
         "^vdd-s([1-9]|1[0-2])-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8350b-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-supply: true
+
   - if:
       properties:
         compatible:

-- 
2.55.0


