Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485407;
	b=QyAiber5n8uv9/ZYhFHfB9nbBQLUOZM0O98POf/CEU59FgSH7Ok1yDOIBmUNvvd6cXs0
	 pN+c/qgh4qemj+ksccHHeugF7szEmZl+/HT2U8/bwWWZNP+Cfkqqqtss7bm00FXRFpmmV
	 Bcktz++NKHHEDSv9+bEMOGbLesm7aN4kwpzFz7ykE/mWgNoVpabtF0ngoggWa3qHR9I8X
	 rSZlkp0QGbaYgGwkzD1Eieo2AxKj3wg/svGBJdQYCu9W3wx0Ib/aPYOEOr1IURTGTAl0g
	 oKW7B9R6SBLlAgdT0dvaIpc6r3OE7U/X5/a4acKhfwOxFIicZu1iqi1bLYM1VLIirKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6VsuKwlRwWJYLAsfMzykziZnzXbEyU4vNFoxq6pdzj4=;
	b=c7nKTBLkngKl/pocBiw/HoQQ/bl6Z/BNF3A/5PefcxPfuey5rqNWFrjPP5qNbuHG1+CV
	 AptE94vgvQ6HH6i8RTW+lSXLNtzdN7NrG9fdw7vZoS1YWodsO0/1k7+2YLBHtsbAmnIjQ
	 X4EPqyYAY1qTL8snxMQGadQ7D71wZb9HBH6gPeIPtSURPXvs80JV75iSi0kjNeXc5DCH9
	 rsPQ/xSC3gMeZumWMBxkNd6Jn4GBW8AzcF7l4HIiRoo8zIpcWtZwomgm6AsCwE3KB+oET
	 Tm8dXkl33YaMRou1bDnOeGj5D1vM70BWbIkjQ5TGou+NI4SGnw5ijJeovWMOFwthJQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAXscRkF;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A4606A31E
	for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 01:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 458A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TAXscRkF
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53644b28706so66877811cf.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 17:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485406; x=1796090206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VsuKwlRwWJYLAsfMzykziZnzXbEyU4vNFoxq6pdzj4=;
        b=TAXscRkF9Yx9KLcAv8IGhP0/4x+zy+9DS5x9iUu9ZnB+ZIpOGR1w+22i1Z0iRAJgFy
         lVOMbiosBEvTShCgO7uRDgbDCGlQgDLwpUlSQboBYkyVgjnNrWRL6w47e8EaN+KSge7c
         +WgICzH1CPR4j/Wa+SFtFGDoMgAGYsoKjzRYiksOGL37i02modDX1lXUL58Qnw0XbZqw
         dhNH/Tl96iERGNyVq9aiHLibJUtEvA3NQEJCEZeGIcxvh7LMrOQsiGx+h9pxivCcwpq+
         4isibU9ICG+cKhwsyqr4oFdZeCNBlt9zknV9zVZ+C23weE76xqvbKtkZFTaYyXP9DZay
         m+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485406; x=1796090206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VsuKwlRwWJYLAsfMzykziZnzXbEyU4vNFoxq6pdzj4=;
        b=05ZUYDswkUh89BJLCGaLqfrS2K64CFEnN446PhC/fvy17vTkVAFSIJc6pCV3PaORpL
         VdgXQardQN6XwIBrun6E78BePmORQ9Wjx/EXH/7K+s2TFz0s5tzUiR6/GooVAuna4v8R
         ZeY3JCPvOKANp15C5hbRGriSacbiZcUxI7XZzxSjaUyzp3Qfydx7olm9p8co8vMc0BM/
         YyLQaMH7kRVdpxuheKcaV1YGd8/r1Ao3F5obsLMqgjE/UYZmWfttqSgoyMC2E5Lp1qoT
         VuLcODTgeoKrGoqMHsleaG6QfPsnygCmC9NxmIRYz8dXS7vXBNxTGdTvwmMM92dh/tcH
         +R9w==
X-Gm-Message-State: APuU4Z9Yq4xeYiB9X4lw/ImhJva5d1M+zb1tDBkQLV/eC1UwgZ6NpQOE
	YhWULFWoAkwnKD0t0A5nbQ+d1yU7n8AiK1nNhJcU7c8heVPnAtiHaOp1absJQw==
X-Gm-Gg: AZFdTZfVDx4WuzKVLP6Rvsqxk6U6S8tfe3yY6NKMkFSOKNEl7LDIGr0WSFwSoAgZ9Ow
	YsD8nFymEjsAIwSySGI1gHhc+/nri2nVvkb+dP8uJTeWkiDnPYDzpg2wkgqulCvQ11W4DV+FXlK
	kS9M0laUpGeRxgMkc+4vbwmCafLPCr+LcKFjsBM7hpnzv2RlpT9stz4QMoLEXyrmIYCcRzp6+Bq
	gBOQw9NfDo7/n427kdpGh5u0U/LsC1PEm07qcd8C9Pid0qK8rpK+WkZogrxagrxe9dUa8jBXFpq
	PuvbUWg8ZtAred5ZB3y3dn3PYvOFy5PnRwFTT7r1yXNPCA4Vy1CI5GaWs6ZCcib6T2sRaZ9hz/2
	BkGNHUL1fg6Vcv+4/GNx95X34tY/kZsNsM5ge99T2XkA1M7+o/Jp115UWMH7R4IWo+knUV1qxl3
	bw3wvPGrJ+5UfrSDeQb88hQMZfBnlPK04WX3AXqByPvAlG6uq2Y27shX+V9HA/ZtroXhLI12QKw
	P8+f6yByDwmoeiIKbzxku0MxIgpLpIGQK2MYJ7eEGK3b29Yzzh9SnRt89UQ2r0wqUzBYUkRLRSq
	cQE2aTel1qproJAzeXFH3CY+I2u8
X-Received: by 2002:a05:622a:2609:b0:55d:6ac2:ceef with SMTP id d75a77b69052e-55d768a3013mr248411801cf.2.1795485406231;
        Mon, 23 Nov 2026 17:56:46 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm115098901cf.4.2026.11.23.17.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:45 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/5] arm64: dts: qcom: sdm670-google: enable adsp
Date: Mon, 23 Nov 2026 20:56:08 -0500
Message-ID: <20261124015611.187024-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the ADSP on the Pixel 3a in anticipation of audio support.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 4ce9b62abe53..2044593c22f3 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -199,6 +199,12 @@ cam_vio_ldo: cam-vio-ldo-regulator {
 	};
 };
 
+&adsp_pas {
+	firmware-name = "qcom/sdm670/sargo/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm660-rpmh-regulators";
-- 
2.56.1

