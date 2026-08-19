Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE6324679C;
	Wed, 19 Aug 2026 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147801; cv=none; b=na9erFqDX8+MpuI18yQPgqV229yBgqKN6Q4awFH1NP8myxEq49y8ri0QJHt0H2K50IUP0eYx+aWv1/LJxsgubFIM1LEXGbWukzRmHrwP5BOhdsE/j2UUBXdkQtrl1veh8IUJuxqVes/oBlt3PMvzaPBa7+PCQB+GkBW2HGN39+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147801; c=relaxed/simple;
	bh=YeME+ahPfJByvAXzjy8vtCR2alNd2hamLlkLbEjwWUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SDIMkqrXAl4MLoLgBKtZbekU5dLrRQ83XNvpPIgnFskok77QHztu5E8wz4lRESV1Mqn+InGtsQJCCEKuJlrPkj0U2VBtMb7Huozmx+IaOZZp1re0YYLmEr3JKYlHVpA+WogRKhgZdRelKcNVBPDkjoTnDXs/EbEcQ+USBy149sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7HhkzSg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7HhkzSg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E391CC19425;
	Wed, 19 Aug 2026 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787147801;
	bh=YeME+ahPfJByvAXzjy8vtCR2alNd2hamLlkLbEjwWUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C7HhkzSgxaInjFENAyTe9ArO1XgI6aSqJCCqOODztEsCuWmcKVnYGFi4V2JL+nHua
	 EY3F7aQyNzz/ci46RYy1v0ndkHJ4/57R5A9orSd9b1D1OaYcsE9TYeIwsr4tCZ0msm
	 bOrp8fSsGEGBxVgRlbDCZuZ/Zcsny/6tFxkuUMbzXKNDKs1xlILJkI/Ce4jEbioqYA
	 MT4XoaWTGNE7AwMwbBmZo6Zc5XelDNBwj2bdAaUI/qPglWEHXR0LtOjmv+9F9fMBAu
	 q9d7nIdl6a7bAjAS2nsO63EBKzSEAO6uR1s/aMFKZjfshQGLi7Vbp0crqkzE1Hzb/3
	 9Oixjs18CzhzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF252C5B572;
	Wed, 19 Aug 2026 13:56:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Aug 2026 15:56:39 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-oneplus: Move touchscreen
 y-axis to the right place
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-oneplus-ts-quirk-v1-1-0cdbcea195a2@ixit.cz>
References: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
In-Reply-To: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcus Ramberg <marcus@means.no>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=a26dFcsPpf6CwuMLNOgEu1hKIlbknD00ls5SVdmciH0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqhbYXXkV/2Zya80zeMIArO0EKbodiGcYgeC78/
 0SxsvvnQRSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaoW2FwAKCRBgAj/E00kg
 coXvD/0V3NLx/uHdrMtUasUnu3nwb7M1koU5+RM41ygBKcHxnMD+9E2dCSaPrOPx7zJC2QjcumE
 kpeuEvDZSrBpxJPmkVvBapisT/RcgT80wqARKmSCYt+agbSEiSuszlKAWqVkUxK3fgYjXJhMBxm
 WF8hIU+t1AiQwa3nD9OUVdWq3bQSrVS3D7GYNbRT+XL+HcgQNH5ACc2vCflG5MZ7WYDB585+qR5
 SHxR+BiPPX4wZRXs+EtIZaBnhurOoPJR8W43qH7lBL5S+CTXI8IW8HyY3I7q/7lXdEJt1Q8SZ1A
 AhsV+RqnqEHsUGkd6sRcOqKy/q9Cu1sLuCGa/blbXQTCfQX3XokJLjOgkHpJDGN5QC3MiM74WZr
 s17DoxU39jrxbBvzb4Bw2KfyDUhKcgV9+frAKmUCf9i/ih7TnYnLAGUUle8KH0T4RByG7oMRt+Z
 /f0liWawjArQTMESk6THnpicWP7bmaeHDUoXAXBr8KvAfg+9kOJVSl2TPKXpENpswaLB2xtSacn
 zJBt3WrQTGrxjLHRJIzIUvwPXO6w3hBtplN3CYzesFSBIkjY5okshtyjH/EbSv9tuD1DYm2MUjE
 KkS2UWDQezDhZucJ3a2M72MG+/ahgxfLAYfBL1Fa9eZZm6h18IOPGnOSuAeAib2fQPqnj3RkZDL
 iBtKEDFydm98Irg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

This value belongs only to enchilada, fajita sets it's own (as the width
/ y-axis differs).

No functional change.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 439779f308e38..fead66d60e58d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -538,17 +538,16 @@ synaptics-rmi4-i2c@20 {
 		rmi4-f01@1 {
 			reg = <0x01>;
 			syna,nosleep-mode = <1>;
 		};
 
 		rmi4_f12: rmi4-f12@12 {
 			reg = <0x12>;
 			touchscreen-x-mm = <68>;
-			touchscreen-y-mm = <144>;
 			syna,sensor-type = <1>;
 			syna,rezero-wait-ms = <200>;
 		};
 	};
 };
 
 &ipa {
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/ipa_fws.mbn";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 3b30d79706fe7..be346286e19b3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -90,16 +90,20 @@ led@4 {
 
 		led@5 {
 			reg = <5>;
 			color = <LED_COLOR_ID_RED>;
 		};
 	};
 };
 
+&rmi4_f12 {
+	touchscreen-y-mm = <144>;
+};
+
 &sound {
 	model = "OnePlus 6";
 	audio-routing = "RX_BIAS", "MCLK",
 			"AMIC2", "MIC BIAS2",
 			"AMIC3", "MIC BIAS4",
 			"AMIC4", "MIC BIAS1",
 			"AMIC5", "MIC BIAS4";
 };

-- 
2.55.0


