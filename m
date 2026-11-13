Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557802;
	b=oodaoSwgWGRygycwrrZKnpQSLLO3Jc3/SvARsRYLfQ+5WajwU+9RbsU0HxWvoQcAWBnS
	 vQF5eKDGH+Gpl5J9PFYip3qx5ygYnHuWky+b19rE5NcNIF/1MxDPRZ3g8/XkuUZJVN2u/
	 EyPmyw2sW4FSoNfGVANkznzYmqgyOXWinNzwFKvhkpjmf0MO8C8ZQqRiu2zCGAtXi67K/
	 BdeGjtRjnHXY9kSgrGBmPMpjZkyVG2HCQfNpg6mcAhAJmUE/gSfWsvgQeLLyZeu3LIzV+
	 oxGwkkkAWql/8zQQP8fc7ew3qvL/L8QVabr4ZH7quhRI5EowWhtJq7triK7z/7qhdYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
	b=i4Rh3QgeQ4om5o7clFhrpTZZZ4NrNZnT2CLntgGadrePyqStWYAGICG8MXbV4NNbyPMs
	 4dUjoPhcpytWyiiN9E9qAD7CTlbORU/s+rvjBKTE6D1ejIIWiYROAlJe2n+/KIrDrDqeN
	 2jlxZNtrpKwk6Wc8EvTuOMw3kbk5LTfwgT8JGi1KdpkTkWguI8Fih8esvvyg1aN0mToGK
	 QOZ+8VgeJmw0dDDEQa2th27IOBEzgQb0Qc/hLsxFj5cFsBOXMMm/VHjdqNYX7o2hz0lMc
	 XdgL/Uh/ifZlWIvTU3zneFr+rQsndl5RMrljAGGUgYR5yw1u3Z2SPa8ES0mVSrTtpfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=MSscyRQQ;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5782E606A8A6
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 08:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5782E606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=MSscyRQQ
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso101856266b.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 00:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557801; x=1795162601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
        b=MSscyRQQ4ju3BAXAXTqwR+KnoFm3xqXW+bk05zNcYmZZ/GU3BcPBJNmWgnFWB3+u/B
         2207JCdcECYzl3Ckdq9gwJKzEXaxeefn0qlLcWzFVGzJK8eHO/YGboT+aW22A5V9tieX
         vMyFzTi/kbdPCg6VtFGgFm0EZhbIZWpmbqZDi22qYLCcsstULFdSTExzs1E766mwH6J+
         JvQmD4DNikUfbjPN+QjlpF+aFFsjlkwu6YYXmzBDndXhYWTz+qGJPvZjD0zvi84ahmj+
         5fvUTnA2Kl/gLwBnCgHambLU/GmtoBf/G2OIVLHlMPH+spsKfIVgbHT39AVZ0PF6xvZ8
         lyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557801; x=1795162601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQFTvmXhc7Os6jgWWtbp3W0a+iCMVy4yMh4ovPL/AhI=;
        b=azcQ/4wHnD7eSyIvRCHjrSMl7/prUhOdHW6KezLENGkOMxWQZiziof1Z36PAfuYMMY
         C4W25cT97ilBIOHMPraZmHo9A9b2HkjbZBfeAuCdPWls4lfbibAWtzX1vUXrLC+qRkrL
         5/wsUr6ulKHzShmAVj8TCa4qXCEghC2XyIkCVBrflpiL+vSLCw4HkpcYFlabPmGIS5iq
         xeksn9kia6Onno9wU+uyReEhmLj27KtUW1r88ZiWPpvh6StoHqjglpM7CDP6n2GqPqIt
         TxB8shmUuW5v1aLxykmlafuMHifBFm+dpTuJSciIyvpQyLaEdTa20jZRkOipGqxI3Qbg
         u+/A==
X-Forwarded-Encrypted: i=1; AL+hErGW2QSYULYxfz5UiT3elzmpLCwxlMX7193y3Q1Yy5Z+RIDPVnwZ7mOO0dIW9vc/ptwQbr196KGq83Vd5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zV6RvGR8XlyUAq96sB7ZsWt8fKKjrCZOwnIquvmN9ddrM96LH
	l7BD1licI1jfrC4rl5hs2Vjwlubf3r3dgXgFwUtgZczxcUmeL5vBAuLdP+CI/LAmzQQ=
X-Gm-Gg: AYBFou2K9Mv88O3vVqRc5pZg+1ozCyAmiso1mMdI5xTHVyLr0EXHI4HVmiUxP9o0g4o
	VQmJI9d/Rv5PmJx1RSxH00o82q8TdopZ+goODUsUOuS1UxlQssMURJW5VBD5zTxhgPMmUdUaBxC
	ShMUd5nHedGsydndXNh2s+DPLrE8mThJZp56FsBX1eklEYiEGaNGPAWWxysN4m0SsLOPG9MVlkM
	ZNgdhH4JAxhdlyEL0G6Go9At6BL5zLz3Si3LkclPJ7lGANL96OYQLJSUMzzuibfUgCMGZgblDcd
	o9SMhqsy1WcM/O/YcU5qn2rUvVfrtxhs+AlwEeL4aOLUKEPQRjTMrcJM/h6dF9QDN5n35NGNqEo
	B802ZWhqY0OITKASLiXXltaYebtGPegpa6ZOIfRKvIeM3ptjJsbLKQMKJJj9THOu8DyChHuH0zj
	Z/2Cc1ZI/8Yg/dYuuxNsR7G9HrsPh+JGyf194wpjkfHglfuLYKMGfYEAJdGSRewxu1cSlL/dmP3
	wlgrxCcqjFM1+7INfR5YmGE/sCibzXP5lNHWXAMge7OradAE8Wt64Fpeler92dciQfwRYaampcu
	etle7vySOkd7cWcrr9tzcIHDLLdYy872hIAYJNNaJ+sSkrtteCHSe+3vj742TAoqWTsZ/zdLGzM
	T3F5fcms=
X-Received: by 2002:a17:907:72c8:b0:c4c:fd37:bb0c with SMTP id a640c23a62f3a-c509642fa91mr120493666b.29.1794557800810;
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:40 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:38 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
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
Message-Id: <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=1746;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KjTKTH9Miq+8wMoPpDn8TAAfkWHtiUZa4QdKBZGsgPQ=;
 b=0gEdfshP1PkmZVEL/h2v+0KFiWjmOvW0x74d6gZcB7Mc88ZUGZl6AjEnXDATqUxlfd90qJxBn
 i6waAEMPGQbC+r+RZ5r+EKzsjOrbv6MuRFlWCZp+Cz6OAfHYIEskU9Z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since Linux has gained LCDB support now, wire up the LCDB regulators so
we can turn them off and on as desired.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 37aa272019cc..d592bede6a61 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -72,14 +72,6 @@ key-volume-up {
 		};
 	};
 
-	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
-	lcdb_dummy: regulator-lcdb-dummy {
-		compatible = "regulator-fixed";
-		regulator-name = "lcdb_dummy";
-		regulator-min-microvolt = <5500000>;
-		regulator-max-microvolt = <5500000>;
-	};
-
 	reserved-memory {
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
@@ -784,8 +776,8 @@ panel@0 {
 		reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
 
 		vdd1-supply = <&vreg_l1e>;
-		vsn-supply = <&lcdb_dummy>;
-		vsp-supply = <&lcdb_dummy>;
+		vsn-supply = <&pm6150l_lcdb_ncp>;
+		vsp-supply = <&pm6150l_lcdb_ldo>;
 
 		port {
 			panel_in: endpoint {
@@ -925,6 +917,20 @@ pm6150l_adc_default: adc-default-state {
 	};
 };
 
+&pm6150l_lcdb {
+	status = "okay";
+};
+
+&pm6150l_lcdb_ldo {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pm6150l_lcdb_ncp {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
 &pm6150l_wled {
 	qcom,switching-freq = <800>;
 	qcom,current-limit-microamp = <20000>;

-- 
2.56.1

