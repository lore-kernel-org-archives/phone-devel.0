Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557801;
	b=koxhTElNNYIR3O9K7z8B5uqYUOBjfQEjyc8+yijaYbK/2Pxiyx+lp/UyHDtqCTYMVlkE
	 QrExOcZLnHaxp56mKKez6ogpuA8gYXtsdXXFMxqcZI0NxUW6S5jNYCQC+nppH+dAHBwuY
	 DjgGKSBXyesW9n10DZHFrDLHTqWQl4c9BxhLlvNufND1FlvpIWO/OEpn4dKefGmvxPedH
	 QYtImqAtRowX4YXYUZ09JshaitJys5Yf6D9yCrFrg/mWvIisxx7z56COa4gmF1yqH0eqC
	 /I0Y6JlEtNhYVlXcTzpUqEQFEdGwRqDaaRKIpoV0sLEX9NqEgP/W45rmw3lfA9CSVCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1ksCAw735zVedNi9GSUPXxI344GdymHkQ7l4LR0G3Zw=;
	b=0qNyc0bDRG/diJkRPSuyocZLfyOzWD6xORIMZYQeJEccRsWjRpxMvkAuKrc9P8D1M0jj
	 bzDCPYFX3L9CP4VJ7o59sH0RL2zGSCjRGiypng0y8BQL3W8mNp7AHtpUTUXp2U7t4seRk
	 BXmfqsAwidk7/YrgkPyFMiZdwOzX89C4WQxfrwPmvqHrswHlof8DZTBhFl+hQPUJGnnPH
	 QpM2aTYUcHWo2ThL2zKqRj7IkDBWyE+T12AUUmdyrWjLGdfWwrroj6mZrTb1q8h9glXG5
	 BMFAynv5bqrviQoFoJ/aWJm8NDSH0xb4dovscG7Ux0+BbMLWfduN2Nb3U2939KJ0E3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXcNDLdh;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA4606A88B
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 08:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43AA4606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXcNDLdh
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so105782966b.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557800; x=1795162600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ksCAw735zVedNi9GSUPXxI344GdymHkQ7l4LR0G3Zw=;
        b=gXcNDLdh0Slah8YZc8PKNyzBkj1Aq91LtjJP7wmzAyIX4WXfCbYzgnJADFAwa/fqnv
         nwBTueq9cA1vq8F6GUwm/HMjqmnepfWBp0KuERX4Hy8A7/HRY0y1KJxJLYx51KR0vuTu
         8OfLdsJKXyT5eAKeZ5dKgpr9H7Pq6HVCyV+LnqF/T4535BwLnCyVUEyPzLuyzolpEmqt
         SYbcUyXEOy1xzaLMYS1lCunGwTVzElx9wTp9pEB+54dw7QUVTFklD+RiHFWK5I28XXKL
         J7v3P2KczCSrnzaRwXwFisHLNYqXt8hj7W6QBI82xzkN1KIlSHQeGzpQMrcvppCq7cCI
         qy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557800; x=1795162600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ksCAw735zVedNi9GSUPXxI344GdymHkQ7l4LR0G3Zw=;
        b=Rkd9lF9tHy3nnBrEaMlTTE8IfA6g8xHHnP65AvWT1M5E8ByrryjocBEeMYdTt9y9xv
         bb7cRDx5SgpzhNi4zTmQROqauHk3lUTUngDDFJlOXAl00o+krZhWeywXMnitt0VoWW45
         j49lzRUMH1iPc9I9GgOsl09dpjHY0Rm2j6X8zoq7cTsAdEzqA4FfNV45Tz/QgYoJ1+hn
         4H/u1Tocjo7e9quBwIm+Tta7CjgOtZqGLLMEDAezzvkOgL3GYyN9srNY4LJp/VddsqyC
         5IbH9ST+pV1aN3MTLf+PMtKa61AWcFwtzRe9jkkQzNvQiPxGJCDe9UipfWO6fs2bFR71
         W/bQ==
X-Forwarded-Encrypted: i=1; AL+hErFLLQIsxeEzQsr/GVkvXy4HtS666d8x/4hQ5cc7MyGOMH71FEEmD1Cmql0wzMLg7MZePQo+lzbrZIGc0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7fmH2yWVe4FGpV+49z3TiH3awMJLYhNjmmvol7qhNI97ghG5O
	jGaoaaTcmm0J456N4DOwZEVQBjur97ftmSN9dOEbTfxsnniFERyKWudbDPmzr69/7V4=
X-Gm-Gg: AYBFou2Ki1NQR0RGrIGv78+YpMAU/t0MpHiu8UuzAYgIitV41S7x3KCkLfFBjrIgRha
	qeULqyqvrhF2jrRhwN3o/nTskEBdSgJiUjOrFqXxf/BKFJQsel44xDF78gOkVN2GM+YJu+cHtjA
	cYhtSB28m3ZzmArhRfV/0NLarKL3aznvxnZKxbr8zuZruEYJsyfAH3AbRGCW7dqd4mJWApF5zKN
	iHQMOkg2cbZZ0TbvoIDUE1xS5WqhaIJ5t2coY5ohr9R1SDHsSiK9EetbosGm+t0UZe+HsPOZ4Ma
	cKbmDcJxopegzFLHr9XyqjcsYuC3Tn6gmA4nSPLHu2MMqHgKozNsTq4JXIMekVXt5ZX4/Si3V50
	doddOihUFLBWV6OBuL0wapByyhdrptmgxKwK2QHEPYm1SrVSrzkyW0RSefZCb0F7hkMSTl/8j2T
	hdd9hI6X/hho/dAR9yDyD5uQ6B6vhPSV90DYcjDRXl0NrY3wGDEKy7yk70n4sS5v6jybp9qDliV
	OecRcYrKMlvbO/GGHU4NouhvjFzFpcHxmTZtTqhBdW8AqUqgdnM92f97f+YJB0jzFtxw3CDenEX
	hl1IKHT3qsbrhA+jrBVaNDp2iDQYBdeUgj/iVROAp9vN/evMfAwyzbdO6iQyFMg4QN8wPjGwgOf
	weoY7z2p4xpcJUztmY3f2GY1ZBexH
X-Received: by 2002:a17:906:7955:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c50963aeccamr142812166b.18.1794557799688;
        Fri, 13 Nov 2026 00:16:39 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:39 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:36 +0100
Subject: [PATCH 2/4] arm64: dts: qcom: sdm632-fairphone-fp3: Wire up PMI632
 LCDB
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-lcdb-enablement-v1-2-1dc40b49ed82@fairphone.com>
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=1750;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wQ/by28OhYBe7ilOwgM0g82bOPZkl3Y5d/m2CTiHTQk=;
 b=xjIQGYG/TkAs5AVuy5/TMPcmDtNlgeT7SLb6wQ1pox7NXz9Ag7KKDE2Jg7Bzrl5jRDReHViPt
 48kqvPIPV74DgvT0WZjTuVj1XV6VCe66T0+9a2YtTF3JIYZ+u2Gz8Dz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since Linux has gained LCDB support now, wire up the LCDB regulators so
we can turn them off and on as desired.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 26 ++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 3223884f9cd6..77331ae6a692 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -72,14 +72,6 @@ vreg_cam2_dig_1p2: regulator-cam2-dig-1p2 {
 		vin-supply = <&vph_pwr>;
 	};
 
-	/* Dummy regulator until PMI632 has LCDB VSP/VSN support */
-	lcdb_dummy: regulator-lcdb-dummy {
-		compatible = "regulator-fixed";
-		regulator-name = "lcdb_dummy";
-		regulator-min-microvolt = <5500000>;
-		regulator-max-microvolt = <5500000>;
-	};
-
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -175,8 +167,8 @@ panel@0 {
 		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
 
 		iovcc-supply = <&pm8953_l6>;
-		vsn-supply = <&lcdb_dummy>;
-		vsp-supply = <&lcdb_dummy>;
+		vsn-supply = <&pmi632_lcdb_ncp>;
+		vsp-supply = <&pmi632_lcdb_ldo>;
 
 		pinctrl-0 = <&mdss_te_default>;
 		pinctrl-names = "default";
@@ -212,6 +204,20 @@ &pm8953_resin {
 	status = "okay";
 };
 
+&pmi632_lcdb {
+	status = "okay";
+};
+
+&pmi632_lcdb_ldo {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pmi632_lcdb_ncp {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
 &pmi632_lpg {
 	status = "okay";
 

-- 
2.56.1

