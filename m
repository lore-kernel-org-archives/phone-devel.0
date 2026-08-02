Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9BE32B13E;
	Sun,  2 Aug 2026 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697468; cv=none; b=imFgqK936433lcXCUVOU23eusJMCGUlGfE7xcQFchDBl2MNPuf1Cx5icah1Ut2c/v2B8MYQoQwBLMQinzQjNpR4y7NgRrs3dtk/yBI3ChckBEbGDt5hYcjJrdb0xz+9HZGdauelfvspbOGL0anhkIRext+ZyBydwJ3Bzc96VeOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697468; c=relaxed/simple;
	bh=33VRFUe1ia4sc4EGTQ4sqW7lg2YDXyGChWk6H1+htfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bnk+dvAD+8eyqLgdWdw6Z9GSvlGQcQ81/b2XqvUdIRjSapP6Q/wKSpRdXFxnBWdhTTkoxAUTk9ZfmIpslisU8FpK7yl+np4wR3lILd14l7BYBYXWQI03sl65hidA5YJQvqhG8CdGYrswcZs3tTkEm6vCr1M8LJ/NNZrC7oSZ3co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ett7SL6F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ett7SL6F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3A93C4AF17;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785697468;
	bh=33VRFUe1ia4sc4EGTQ4sqW7lg2YDXyGChWk6H1+htfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ett7SL6FwgXE0wVowllEQX1YzqCBKIqtxbt3CqflGafc5FUGjrT4eSpQXIN+j6eHj
	 v6X5Fhm5DhVhky3H8l1e4NWWZNdnv8vBNfVErOjEyck++ga/XBlfu/rEgXj5B80lEu
	 gBcN7/eBsTG6bZaF4Xxz6LPrPJiiiYKqpEDgXgVbAJzpDirklyFoDRwLPb8jIPFGNr
	 hMPIjvjktl02wKKHA9WwiiAJHbBmuF1jSIAx4HHbjhND485N+C2G87weCORCI3Ekqe
	 YoZa1yxlgqoPN3z+GgkiHWS/8Y02Or8E4rahwTwREndcKICu06RU1HsuycQ4Bllipu
	 vpQy3TDp7qJpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF680C55174;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 03 Aug 2026 02:03:51 +0700
Subject: [PATCH v4 7/7] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and
 Bluetooth
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-msm8960-wifi-v4-7-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
In-Reply-To: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785697466; l=1107;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=YEVFWuvyFZSDJ7XvbXL0CEUIEEqsy2wW/W6r6t4OknA=;
 b=Kl/ARHKourJn5izfC0X15EV7KWYPB3ZSX6J+Tm/PYTA1K4i7MghHvf4dBl78HUm9Lwi8CsGb/
 EVm9U2VY4XnCbpU/1wB/8Y0ADJjoyi0gu2K6DBLQznhO2KLMw+36fm5
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add Wi-Fi and Bluetooth support for Sony Xperia SP.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
index 591dc837e600..7d54ced3641f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
@@ -95,6 +95,21 @@ MATRIX_KEY(1, 1, KEY_CAMERA)
 	status = "okay";
 };
 
+&riva {
+	vddcx-supply = <&pm8921_s3>;
+	vddmx-supply = <&pm8921_l24>;
+	vddpx-supply = <&pm8921_s4>;
+
+	status = "okay";
+
+	iris {
+		vdddig-supply = <&pm8921_lvs2>;
+		vddpa-supply = <&pm8921_l10>;
+		vddrfa-supply = <&pm8921_s2>;
+		vddxo-supply = <&pm8921_l4>;
+	};
+};
+
 &rpm {
 	regulators {
 		compatible = "qcom,rpm-pm8921-regulators";

-- 
2.34.1


