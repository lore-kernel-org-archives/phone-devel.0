Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F269418373;
	Wed, 19 Aug 2026 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147801; cv=none; b=V/id9dd1u0r12DQG2lmBQ5b+jkkQubPeRSgU4NjYPjQeN9MCkO05idBG9L2HJ8GirYTFF5GHN15a1qK1oGnyZXUjp0c0468/6O6WbfBi0Bnzp4AJp2b08aWvPK+UO4WW4PQHVHaum4CCWylak27Ta7fPsA4DBPonqyGWONAB6bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147801; c=relaxed/simple;
	bh=A7g1v1sO+v0lXCVUR28VH8pRHZHsFZIQvyrD9K0GTD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHTqh0ROguCcWA1hYFFJcoF6bauDGGqv2wkC6g/8rh40YbcU2TvcVAduzEydP7Lo9x+nj0dvpu+KjuHYE59JMn6loH+Oj4h+gMbZc9nWNJuF1yphHCAxc8/8bvopboOW91gjTXScOaJuRQF0Rt93uZbf5XgX3gGJ7rJ5LO/tZXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkpYVPg3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkpYVPg3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F08F6C2BCFB;
	Wed, 19 Aug 2026 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787147801;
	bh=A7g1v1sO+v0lXCVUR28VH8pRHZHsFZIQvyrD9K0GTD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lkpYVPg3xicuzcndnX27jGIzvkkyQm4jTMICtyVRTX0KSJMsBUGy4XYQA9F0X/Pcs
	 5Wm3A/cq+CYp94WMfdYTnwUBgyov1R7rm/9awhq5BgSFBWNlmC3UNivqDx5bkV1p1g
	 ZPLCgu2598/C4kqbhA9FJDzdZ1tdFCova9Clia7FHdzFWkan22v5BR3DhiBpXfd7sA
	 HigwD18bJVtF3QxecbvIUDXAc6Dx5w82xlwtRl1wTgL7niapprpNCXcpqo/XQQdgnl
	 NOiMvCGrNiW6xdaVxpSbAVmKMZTw+SVTry1BsJIElI4WPKVCARQDvFOEv6TBMTzbj7
	 5ULZcJjOch8Ng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F20C5DF88;
	Wed, 19 Aug 2026 13:56:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Aug 2026 15:56:40 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-oneplus: Define touchscreen
 in the detail
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-oneplus-ts-quirk-v1-2-0cdbcea195a2@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=RZY4dkp9L4vG2YEomAXZZWWwCLxe2KNXm/xHA0DScVU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqhbYXFlxsXQQ7VPvnnXgi1kNweny7uhqCPCLWR
 aev2tEbH3uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaoW2FwAKCRBgAj/E00kg
 co42EAC4/045CoKchklXgBWQA5SUhNiPac+6/WZtTVxR5UsZBUl3g3b7s9SAMJbdmBaLNtC5QnH
 imwSHB2O1yelxO9zJK84sh5rT6bFqeHbEWdwfbIFju5BVFWSX569dMJcZq0qKJ1/XsuBzh6uMa7
 0sDTmv9x9mrfujCOu3z3w5/AUQBmTmhQzSy5Jpi2V2eUuBojAR85a6N8pv78MGWzJY4cWdZPuPt
 VitCLMAP0Kn2GrN6Z74hGDwGkcb5Jh7H7iROQ+ozBFA3W1ZOVnqjemG0yI+fvD0zUy6Kev1bkbJ
 AMBzalRhziRmUupUyv0SJCv1kx2Qnq5nplBID74QjBt8oBZ7oZ+9TZwpxEQn903wNnGMC/M4fvk
 mHEqQOolotn19w7/sWsLZpI33WtJsrkq4I71YQXOG91Pw+B65jH9g3usHkWoBWO3fxOBMcKlquD
 8mv6UJMUYJtsbzb7pdIAhcLfvn76cVJ/I4KNgPfpxek5M8TrgKrkxDSZPSk25VrmD08Lx4Fji8D
 js5eoKZMmZ7FJD7+S6nGeqtDojZdy2Jq7YwP2Zr+065o0foO9Io/ZRTEaAK79bOlWi+Ejl6WCF3
 wmu3N6ooWjMTnrzY4dVirs3Xea3FLd3n/AAG3WI8PB6wJ/0sXMwGlgj6H5UFThoR/HNzeTwVoVD
 uHTQdDX878G+Dlg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Once probing, aftermarket touchscreens report touch over 0..65535
which is unusable. Be explicit in device-tree to avoid this issue.

This change should be irrelevant for original touchscreens, which
reports proper values.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 1 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index fead66d60e58d..4e65c2368c728 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -538,16 +538,17 @@ synaptics-rmi4-i2c@20 {
 		rmi4-f01@1 {
 			reg = <0x01>;
 			syna,nosleep-mode = <1>;
 		};
 
 		rmi4_f12: rmi4-f12@12 {
 			reg = <0x12>;
 			touchscreen-x-mm = <68>;
+			syna,clip-x-high = <1079>;
 			syna,sensor-type = <1>;
 			syna,rezero-wait-ms = <200>;
 		};
 	};
 };
 
 &ipa {
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/ipa_fws.mbn";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index be346286e19b3..276217f7216b5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -92,16 +92,17 @@ led@5 {
 			reg = <5>;
 			color = <LED_COLOR_ID_RED>;
 		};
 	};
 };
 
 &rmi4_f12 {
 	touchscreen-y-mm = <144>;
+	syna,clip-y-high = <2279>;
 };
 
 &sound {
 	model = "OnePlus 6";
 	audio-routing = "RX_BIAS", "MCLK",
 			"AMIC2", "MIC BIAS2",
 			"AMIC3", "MIC BIAS4",
 			"AMIC4", "MIC BIAS1",
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 0542333a83579..e9d1a1c6ac596 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -65,16 +65,17 @@ &pmi8998_charger {
  * The TFA9894 codec is currently unsupported.
  * We need to delete the node to allow the soundcard
  * to probe for headphones/earpiece.
  */
 /delete-node/ &speaker_playback_dai;
 
 &rmi4_f12 {
 	touchscreen-y-mm = <148>;
+	syna,clip-y-high = <2339>;
 };
 
 &wcd9340 {
 	qcom,micbias1-microvolt = <2700000>;
 	qcom,micbias2-microvolt = <2700000>;
 	qcom,micbias3-microvolt = <2700000>;
 	qcom,micbias4-microvolt = <2700000>;
 };

-- 
2.55.0


