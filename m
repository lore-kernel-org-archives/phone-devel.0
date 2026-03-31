Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A173EB7FF;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946808; cv=none; b=OjSDUgqBGzyyMMLFybSU8W0AzXzpj6iOpErRH9yvMbheDmtDaTctp+/SLdHyOsuh5ySTpmThy+LBFQ2SF/9MQWWTUZ81cK/biUNTjZiZRUKaxdhXJTfV7lEqBfCfLjM3V8fA1uqw0Xd4a8nNufJbER50ZFDGTttdN5PQSJDPDv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946808; c=relaxed/simple;
	bh=9BTqj89bZxMO325WD7xX7lCh2duf1b3+w/twlN+ydgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcgCxf+K3H5xyPIw7dDlE279A53hTtvbmT+omEZVkgAARgt9MFOdf0b7c4rIpLwYOo0HqXejEkjq1h4aT45PBB/y9MwX8BR9FAfZ9/HzHpJOHM0giPr7ZF+WwOTqVZtRA0n2QpfkUwQ+axsNEbm9l3arI25gu7+J1wx+xxTn3D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ur6wD4Yj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ur6wD4Yj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72521C2BCB8;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946808;
	bh=9BTqj89bZxMO325WD7xX7lCh2duf1b3+w/twlN+ydgw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ur6wD4YjfqaTkjxMIw1egpYO57XBKMZsTBI187M6GcGQHjK0lpxs4C1b+Js6Jaq4Z
	 J4OTn18bZJX9mdnBfM8/d+sgXyMALTBmI9SgmsXJzFPnHEch4fcO9p8hJ4gw1ailBa
	 lggWx7zji1gS9gJITYaEntfpQAwWNydRjPh8KgY63fWrxsQ1JkWrs3RMOxdOkQtk4g
	 rHgUOWO4uXywaD1ZDJnZUriCeu0qZRe5GHg6b/HiM38rmiT8JvJoANK4vAC3Mu9OoM
	 DoiPDPg22FHe6mDD5KEk3EO7qTilc+V8n4YEn2HIPUJ54wYKayZwwL0Wgp5sJpCcds
	 QYFDe5l59MsDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DB0FF60F1;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Tue, 31 Mar 2026 11:47:12 +0200
Subject: [PATCH v5 4/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 WiFi/Bluetooth
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rimob-new-features-v5-4-5fcf42a29c12@protonmail.com>
References: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
In-Reply-To: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774950461; l=1054;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=fh/EPBf6DDi6xO2cT/WF/4Df/j3opWByAPpvZnndrW8=;
 b=HMR8LJo0K1WR0rIK+nK/nE52KfPHYkMTNNJjMyXRqiLm5lV0EnbBv4jESDlkcfOEXWJ6qhIRv
 JcKGVY+SCrUBA0AhU+U+MTYHL2FtHtcpYnU+T7FbA6vk7btRnDTj3Bl
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Configure and enable the WCNSS which provides WiFi and Bluetooth on this
device using the WCN3660B chip.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index 5a9d71d1e466..db5c9f04bf1a 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -326,3 +326,18 @@ &usb3 {
 &usb3_dwc3 {
 	dr_mode = "peripheral";
 };
+
+&wcnss {
+	vddpx-supply = <&pm8953_l5>;
+
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+
+	vddxo-supply = <&pm8953_l7>;
+	vddrfa-supply = <&pm8953_l19>;
+	vddpa-supply = <&pm8953_l9>;
+	vdddig-supply = <&pm8953_l5>;
+};

-- 
2.53.0


