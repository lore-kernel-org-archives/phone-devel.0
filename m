Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC126382F21
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 03:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013378; cv=none; b=a13Y9IBa6rdGlx8wdsL29YRpfMKx+Gp1NRVARRvomnraM59hhkrdf5876dgmqXfGCmTeUSi55z+ML+nkqG8hOxOA5a8jpGneRd0WLM+kbL/xMETWFw/wwaUvzo9Fse+tilmIzDsygXJqj6Ximt31Qgy8ykUa70fBP3OtKx+FAMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013378; c=relaxed/simple;
	bh=vHcmJbJnFiriXlFNhyWcvijfXUxqMdaq/h0SYf7nGzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxtXqUyCWMoAm8GJf2oJXDnUT5jKmjoZ9zZ0CbC6bLwABDrXivn+0NPIXTMWx1xNwXC3EkJzpTQRGhHdKCLs0kxwxRcDHuwPZbqFL+JOxESty+fZi6o2i6CgmD3LwUJIclgVq5yxCbubq8Kt4fF0STvvLaGcI1j4sF1uf4jXwhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Tv4Iqk5O; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Tv4Iqk5O"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXAlRMGR7jghkP+lnXdIYmzb8QsrY+DHKf9ZcHe2wtQ=;
	b=Tv4Iqk5Ol3JBmq7hWu77bZNlpNIRSa+dzJ3Ih8i6Pap4KzVQhMrnILbiSC6LgUzX1Vyxwc
	7J+1IDUN/EHCE63O2KXV0FhTwbP8cQeBpD5BoNYutX+f2PdiPvA732tj7/5GCis/4JjN0Y
	3OHPANHxCDJFaLBoOhZk2GvI0vFSLqFRgpi01fb3Vm12tIWRxhQoQBfEQvirfImIeN8CQ4
	5Wsmn28pcQCa8hoKjTKcOgi087ba8aoGfB2EbFVOoiAXdgY/gspNr1j/6gMp0DXWpIoeBv
	WVOsDGJXc3Jbr0Ew2/4iIi1ofKbkcdysGb0TrbmyzwhxGiChrsK9ZhBu/gZsZw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 31 Mar 2026 20:15:12 -0700
Subject: [PATCH v7 07/15] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-judyln-dts-v7-7-87217b15fefb@postmarketos.org>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=1347;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Ei6IXsIEZhjjI+rjDZqYmLKiYsgQWaTi16fUGmKfGLE=;
 b=6qtnKkQm2ZecTg6r/vtk9T73N5mw57k8nfMKDe9gIxoqUn5BEgIjZX/KT68yvouKTVdmxpwkI
 OX6r1hcpSTwDNSiuVPqxS4EV7ZrM55PBddKdxtiK3r9vAwAE2WaRBGe
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

From: Christopher Brown <crispybrown@gmail.com>

Values based on lineageos kernel

https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi

Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 90dd5a2a6f30..6b837da4ef21 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -37,6 +37,14 @@ key-thinq {
 			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <3000000>;
+		voltage-min-design-microvolt = <3200000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
 };
 
 &adsp_pas {
@@ -67,6 +75,12 @@ &mss_pil {
 	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
 };
 
+&pmi8998_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &tlmm {
 	thinq_key_default: thinq-key-default-state {
 		pins = "gpio89";

-- 
2.53.0

