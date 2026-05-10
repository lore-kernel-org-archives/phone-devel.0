Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124892032D
	for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406484; cv=none; b=JksiY5hhbcfOB7wjcunjcsmhLnPqJzOdpe2GssJ73syBcTjL+lX6l1oYmE8BXJH6dKiEEyMjf8bIWcZEx0lF2i0pZ0Oejnn/jiKp4bb/TCFJ4aPNAGXiuxGkb+wPrnTCLn0UJFJHITrE6ir8632LgoNk1/zDa/hblH9yd4lgMNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406484; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NM/ccRJWSnJ3es+eZWVUvutW3/ocJL/U4k65j+NnqyUq1e/mRvOvW/pKhy+axstYRM9tmc6RQzFHyN1Ui9Yf71BymBSxIlwC1iSsq3HrBe84mTJ64/AM966QE19jme96dmB5RE95pqj0wZQlYsppTXCOQC2/eGtt0XBvRKyo4SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgf7kvMm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgf7kvMm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so1946722f8f.0
        for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406481; x=1779011281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=pgf7kvMmVkYJnmNLJoIUPvxtNlJMODYv2qv9olqLxTA9xJ34iJzlzS3ckObW5BmLA8
         9KYGhGj7JH4bHoo1ELMBamLipuaOrrc//AbOesrCHKw6rK3wroS/8Au3IFyj4F/ut4wh
         kvJPZTQmDF0FiGuL2ZUWB2UCCRRuaAK7a13iqSx4O266oQH4FbK9TBjaTIppQkpysCtV
         hc+/7vwyovW9HkAdM46eaTF7UHAdamEyTHgqontHzvzTUC2tEWi11vuKijxJED9445u8
         YrtkjCkyGbrMuIcMJBf0tqa9pD9Sc3B3s4oWQfUfoIKemXWsGIq6cRmZHeZC2soIZzyO
         mElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406481; x=1779011281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=lisZauR84yoWs1P1nbkxf64AAYuQqK9LVvW3PnTUT6mkzY5Yk/fIhOmSgvUTkHR6gM
         Pk6K7nuScNEvWBqqU9hhiIi+eURG5azd5Fkz2A0rpaaJZr2oWI/jc591dLNPK/xspt4Z
         JSXl8g1iZ0nhXqaVf5f/O8i9op3uRLJav14Z1vb9I3sXlaP6rBSgVQekpXoI8JKJ0jpf
         2afq/G0Y6EB7cTg7rv0S5G4MD0PT6KFjl+04kN/T5FlxopblMwOfkvcxZWjz1ZhQ/kNc
         KESD7+P1XpyD3udaMHm2ObsqH70NGqm7/kBzJuaV1pHgzqILxUnSpO0B7z3OBXtMuoRZ
         2KgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+asPm2O6wPluYJs48Q56kfQ7xnpG6t4DOE8uNOwhCzm5pw7//20LtBpZUkqaiKCqH9YNC/gEaEcz1YoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza+4ndXiD84Q3j0P8eBGp3DzUFOeExYV3Zmh6xpfxMRhIfXMfN
	WYzZVbWdnEjGZlcqk8jIryzyYhC2dprPhvFhTm6pWiuRtXRV2Pryl9vo
X-Gm-Gg: Acq92OHOTSxNrhgVHicCr5aMDUkt8X1cJdttMuCokLgEiny+vvCJNL7jgTytF+XCSOA
	npTMU2CJ2GGUkJ0j4PR0lADStdbVpR7Klc5xeYBBM4a+SSz/ndbORVVwTxQtqv4hYjbXxXqAZ0Q
	mNps8Zp3JxF8cLHmc7kpHNYox73z+bTzQLzV1ljYPS/zTPGxAKH999n402SYIN29Q5mLrY8w62P
	FOe1kLIpddtToV36d1QsCpHLQb+3urPQ5lscG8TqrGbKZ3VYXgDhyy7djmpvzFTlVKbVCpmQR7L
	ArHPIH2L9dV/Im3ykFA5L10iVSHsFkxmmusQP+tRUX6vyvrKy9wy6zHD36NAJWzkO7Fz1ZKFXev
	gFn6XabamQl1Rl3IsIhRuYMxwSKKDt2wfH5Sh3rb/84IDMVBTheI8lxAXg6YBryPui4/qeOR6tB
	DymEEYEwFQ2l7MhCv+2T6zfx+P7JmKYZSajpQXEhg=
X-Received: by 2002:a05:600c:4710:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-48e7854162fmr52680165e9.25.1778406481389;
        Sun, 10 May 2026 02:48:01 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:01 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:41 +0300
Subject: [PATCH v6 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-3-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

