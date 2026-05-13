Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E36F3B38A9
	for <phone-devel@vger.kernel.org>; Wed, 13 May 2026 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707562; cv=none; b=Sf6o55zKrkjTx00PPOats0aVoFg/QFLfitwJ41YtZuPpmwYO7WqoBzGvSQ+6GPtUks2Qe/zdADQIBbYMUC+ouSpEnR0OhcKq3NViUMYpU4wXyEeXG4bm910vSG73drt3HcT8OfPj0vcDzctGu22sOEgX446qjknilr9EPrMHVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707562; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjEPgM6liDAg9Rg+1co/Okqas6gHCmlidKqBfTH+7PM7Bl6IcTHOC99q21yJUazv1e4HEizF6Vc8fPnzRw1l66qhr1AgqH0gtuk92mx84ngsTTXY3miAyIwmwFvuGfzCb5cbPRfpZcMQlsxIa7u2Yuzwcfmq+wctfs/n69U/Ai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUM4QVRs; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUM4QVRs"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c477a3278so7780858d50.3
        for <phone-devel@vger.kernel.org>; Wed, 13 May 2026 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707560; x=1779312360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=AUM4QVRswER92qtwHjyQVmWKTlEtgvxT6ShGu4rdeSHpmeGX6cBGhPwtBRS+u9m6AE
         otpzzCLfv933N15iuYZBTlKhJL8zMwVlFSqP2lbNeEbwDjYx4m51N82dFtxk3egp4+TD
         k03QJyEfKVAs7D/udCEJoqwtjQxMBIeB7IFe8DXXCfX26nfb85GIciN4jheLI742UlDv
         871ouuC1SgN4KCrgj3JKKtUAqBRlHZDG9ZpDpqbtbBnodxs5dlIwipEiVDal0BLzMp44
         IhID0j9Rw1LyzmkLfJHINa8xX7ghS6eAYhUkrRnXmMlNGJT6Wpv++BzyzmCkBl3PhGxS
         /VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707560; x=1779312360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=qZBM7sU1AF+nEyCRS2u1PGe3uR24M3HZCGXpW5Hujq1c9uQmiGabd6eLDuaYRFVlK5
         g0Jr9LlbY8Ubgsf7NEeT45Guvb98P5h6kiwtdGC8HG4NCT2Z92ZOSphWqw5w0NxptTLl
         foHHUsNSyBON/L1MrViQTXvf9mZPAve/2RM3/LAr21hXVIJm3oOPJonMaKyhve4LIk0B
         +X+Uj7rWhY9AnjWECC4bqlA5AvVgVYv3Msc48pGLVe4fqVnbZKEZTA6lZHggaZUBm5Dh
         jJ2NlDNCK9b4zKnbt7UVRvEN1q5J6PgHV275NLakgtKWL5KLeQipW2ip0s5aHPn6LVeB
         zg2w==
X-Forwarded-Encrypted: i=1; AFNElJ8k3FG62pMMsWj+OJ8k7miNlmJOcJZfXK/eYt1w3BiWmrf5omjtNR2T2pzvj/BLT6njzUm1/tR+kAtbgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPXxCoOunzdhkJSsZcA1ZXhOUXYITaPFohOWm86WYNW9JmXWm1
	4LDplCgYrRD3jZbCIK0aYLW0hKnUkgzEdNCpOL94hgMCMiwyLC6vA0nu
X-Gm-Gg: Acq92OFcLOgxkmncrAGBZDEvmzmYIh3rrFX5xADhD3Cb5MMC9NC7ocOnJSn21duK5g5
	T+APstQ6K8UixceYba9Zgnt/O3JVN9RuiKejZBza3saznas0oiml4ER1UvohJCiR6/xJt3he/h1
	97mrxXtj4TRiEgWAeTLdbUPwtKsvo7I0lPoV/MbKmxhB2RQnJxLe9ZG4vLAQ/WJLwXOI42eqQ9f
	c8ic6meqGGkL/6z5aHP3WXxSprmojneYNNVOQA/NORQXKG4uD6kJsx0emN0lJwYUepUJTh6OGI6
	O7vSSqkW7ipVDL3aZlOp4FLTkVxwrug3MRyBcuG3JJQRsv0CLtWOGi2NUCJWDJp6AP9pydQ7rF2
	7uJjrS3bW7+84Ns7JnzUfRHPGLo7y/Ctx6oHPlO+/fpfeujsswh+OONP5VWIbjecLBupxCxHAMm
	eg5bjlajtI27Ss3osdFXcuRYN7FQ==
X-Received: by 2002:a05:690c:ed3:b0:7c0:e1ab:87fb with SMTP id 00721157ae682-7c6da11a9e5mr45927147b3.12.1778707560454;
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:32 +0300
Subject: [PATCH v7 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-3-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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

