Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557800;
	b=Tx2MBmS8TnkmwGMoeJQVubmy1jyosImL+n4rDVckieiJXdo9BZWRcajHG0v1UaqO3k4l
	 h3u8J/vWdUH8IfZRsw4fmnvz97vdmgmBMDRIqMVikAMPWr47Sv6c7zUrVhnPEu8bPcQ7N
	 iV2FyKHwrSnf9XZFmvoK1x+f85hF1XSNDxmiRaRPxfD3/hP4AtN03ZcX20AUcL36Ov/Nc
	 Kz2wO9xnFWQVCGPwYLE9c70/ex0LLauf+/f/n9GBQ8Hos9nSR8Uzxf6oLjlPWyCa65ofU
	 4TAqwV94OqhSuoJawCJ4TApFEo6mmpCUcv/FZtcBGV1BE319fUb0qH4YakIlItk42+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
	b=Anf5osrH72g9gv8+gPj4/FrgZR22TG8g8NExqDnhwUglFlSgJTem1xt5TNkm9xd1Qn/Y
	 jXb+hfI0VcFBga2HQNpvnyajScnHRZxiSEAdMtIObdim69Q0tTtjsZlHryGyJcSA6QN99
	 gKBkSs5T1YmVVbt91sxINaqFnRy1Yji3S9skZe8oYDm/HKaHF/WOHWDAmDF6E10fbG4EC
	 ATt8sGxd0YjBSvseqV1kWUXbLahoYISJpNknY9NHQ8QXwHpNhuS+iW2K3JIU106e0MXER
	 /o6F3iYVu7NndAjvxqaja/kobOdwrxmx2bw5pjHlYBcbyj1/9uZuYK/FZNzBFVYromQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OZ0TtoaH;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BF9606A338
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25BF9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=OZ0TtoaH
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso1269935a12.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557798; x=1795162598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
        b=OZ0TtoaHRNUCuyN+OfM7Jk1lrmCuCjwTTasUeeUsisIE93qvKbPIny/mIqEc1gBNKa
         tjBiklMLMkNAw6diqZ7UsW089xvDqnIlkgLwio6tCE3z8DlTjDJGhIZ/cU143aO5tAW8
         TlbghxxzGLxLW1js2cmshTxFzzXrLj0zcWHaXhApr+6OWYvYGZexYLpw6AuzIglPmbv+
         TFZEERW6rx65pCsn6OUNVolIE+o3CycNx7qdO2KQWwnr1AC3T52gsff61uYy9IlscfTo
         uUDDJJGbr1iDeegh2e6u2jthx/0HXMiN7vaV8GdRXqGJm3y5caEx8I0/5YCgwnYaZ7H4
         xKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557798; x=1795162598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gW1TFXrxe4ATUFniHdL2t1wb8zLbd3jJ3aJxWRfHEww=;
        b=dGno7XcXMMlXVbKuBRbehuSspLZscFpBPtgBn64z31abiQahptoMTLQaFsVpIH9HQN
         7ASjaJHYJPFVTFJk9zQmplP571v7poCTWbIicPVZnGoBB9Tf9CB+ObotyvBDztRX8dqA
         tBFhakmTGgVcGcc6Ol2asw74nHNZnfDz3hdGDhGtpLO6BGnjKeCYH/WQIZi8Ky4uRrzt
         HDcXAjz3Q0wJw3uJL7Bdqs2ulkhqh4ExKBn/2bnExrDFmjpguBN3WwV8ouZQ3VXOR7Oy
         3xxbBz83SC/F0qHlqQWAqOp4dBVh0jmLZJQi4T2wXwwwQVV9h9+EVqeU9m64jesNLWi+
         G1IQ==
X-Forwarded-Encrypted: i=1; AL+hErEpEsN6TlmOAo8/kdmm0GblQn5+H14Iol8f+PYGTvU7Kai5UEMXXqvCdLbVgYHYdmWl0iE2ENuxi+x7Sw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7ZmZ8ZclyiGqaRLXg3CoN607UPxO3eNt2mup2Bpor7T1cqt7+
	yGvQwZA+yRDEnHlMnhZ9i6zbYDrk7YW4TyHRFVEv+qMg9kyn9CPGD2ypZrnYrRodrnDJ00dkOsG
	/pSYWfM4=
X-Gm-Gg: AYBFou2cWaQb5cNv/l6Ul5mocHkut26f2nEx8/zgeIgbI+MRwRjqN12EAXZ1yx9UbDC
	TWVVtGXxXf+XsceNcdwivnMuPjILc43+OfYFdNGvgMSY0+TvHAlDI+CL+jmZDqgeYi1rQmR88aP
	bma9h8vYuPaVd2hD6UWOqPEmiIJJO1+j4AeeP5Y6C1/n1VnfsWK72IUSyLu05+F3E4ZPSb9OG5I
	mKvzOjUBJEF563vQVcvV9EWy4HqYcKO58NBjyKIzmpG88mYpRFV1xGSIrhB8rWRU6jVyTkNBHnH
	NmANU6o8MCGzBCwofoGBn3vDsKiVewpxF0fD9XOGmyxnkTS7dJmBuG8dy3FUNPsZ/GkDZxZlzVD
	8e2w7XtUe1OTQVYHvpVXhYTMWf7NcOts958l6a+makezUTcOXBvsQrxnSXBWaL21Qgh03Pzk1h/
	V5HXgVh4jlm+7/8PSzELTPiTeq6Rqt9oV9vFOv/zOTJeAg5SzLkhGdMPzHZK8c6vupJCJyy9BIn
	yKiwYjJCcvReRxVFgKRHyCXg2Yc4vV+i5ojIcf4+YpAiHiCPMXzIJxnVphIWfPjQNBJvzKe56OP
	M0dtUElkSwZ/AVatiOObziFC8al+hS3VmzXtTFBxYLbLMqmnpNWYU0cCA1yQq3sNpTELTgvxsNT
	v2rVwLX8=
X-Received: by 2002:a17:907:6d06:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c50963dc6aemr131877966b.10.1794557798644;
        Fri, 13 Nov 2026 00:16:38 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:38 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 09:16:35 +0100
Subject: [PATCH 1/4] arm64: defconfig: Enable Qualcomm LCDB regulator
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
Message-Id: <20261113-lcdb-enablement-v1-1-1dc40b49ed82@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=687;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Cb0jzf5yf7B35q4+LHh6E0ES6V+yP2TAPYPGLiJwWJY=;
 b=lLzlMM1LJlgxpG9XLQ5KkHczWQw96AMoeuDzzlMaFbyaG/5se576a7+MKM21WHa+mdbYWI9NR
 DNnaD8ufsFdAdbbFAk0sCSK/641WYpPGX+6bVv4C6lJUq8Hs3VquxKu
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the Qualcomm LCDB regulator driver as module, as it's used on
some devices like the Fairphone 3 and Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 898f4f1d5952..d0869b08a69e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -910,6 +910,7 @@ CONFIG_REGULATOR_SGM3804=y
 CONFIG_REGULATOR_TPS65132=m
 CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_VCTRL=m
+CONFIG_REGULATOR_QCOM_LCDB=m
 CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
 CONFIG_RC_DEVICES=y

-- 
2.56.1

