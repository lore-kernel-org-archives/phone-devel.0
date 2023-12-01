Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EeD95u3m"
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405F5327E
	for <phone-devel@vger.kernel.org>; Fri,  1 Dec 2023 01:33:46 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54af1daf6a9so3173684a12.1
        for <phone-devel@vger.kernel.org>; Fri, 01 Dec 2023 01:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701423224; x=1702028024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niGbj670flkgPie6QF876KkLwnZEAB/QBU6SIajf+Qs=;
        b=EeD95u3mVtGo/1uuMTq9lGsHSm2JbpAUkH2nRPe0QRKZhr/XIkqRvlwp+Y3yNHdx1r
         moVhNc3PvJd9S2sX3BcjuSEnZenCKg3c0Ggb2JX7XRInjkpzw9nLZSWUn5AcxHSTeJI8
         BzXb1vhQY7e8IxTgs/4Yu/6xeZkNEb2ms/kwqSNUVlensm3Fj6IOjpGPORL5DJU4fN5j
         GrB2JQQwWJw4u0mmI2q+I3zLbwdisBSuXcOnNVs5eD72pq4C3qESmrxxIfC5A2I33DeY
         YXWNyKdC91Ph+3dGjlPpLCczoN1adoIwBZTNI5w8C4MySJAD9ps5jKRwhSmxZ99JG+aH
         PKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701423224; x=1702028024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niGbj670flkgPie6QF876KkLwnZEAB/QBU6SIajf+Qs=;
        b=TRZ82oEyEmWvCYDWcOIUk2BWCZs/ykN8XqDQmACQZ2wBmiayrMAmlas6P/jIKENLHc
         wsEhrvy1id/2qGdGeINnOeDZtNmn75NnvlIi5gDaYulDLozKbrgQwHUn5pRGYuxRVdkh
         igVcOfrsk6zzpSya6KwpLZkumvS0QgrpNsbNVSDjSjPyE3U/Bt6jo1hlJBGn42AXBUCD
         VoSGaCm0hzGbJfBXB3U7uq3r/PluEucbaq2Oww04C2mNtsFsJdMJ9ftqndXkTiAqpMSo
         zXDCLUje6JNbO47basabDrj160pSmR56Ia/YrkYOjXJRBsj/uv+1EPSTtvrkpMit3qoA
         ydDA==
X-Gm-Message-State: AOJu0Yyu/ZF8zMDf9gAzS/PDVfzu8B/n9p9KwyAjk7FrEziizRUX6tNi
	XQTFfxPHjjRdH8keSrGuptqQMw==
X-Google-Smtp-Source: AGHT+IFJZAiqLGITBB9Yi0hCcn8yRnUqkmyP8eOY/RIfQMB3OI8uDZT1rn/dXA6QXyfX1QB/Ha0Z1A==
X-Received: by 2002:a50:8d52:0:b0:54c:48aa:cd0e with SMTP id t18-20020a508d52000000b0054c48aacd0emr1134309edt.30.1701423224409;
        Fri, 01 Dec 2023 01:33:44 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id b16-20020a05640202d000b0054bbc6b6580sm1423708edx.31.2023.12.01.01.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:33:44 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 Dec 2023 10:33:18 +0100
Subject: [PATCH v3 1/3] media: venus: core: Set up secure memory ranges for
 SC7280
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-sc7280-venus-pas-v3-1-bc132dc5fc30@fairphone.com>
References: <20231201-sc7280-venus-pas-v3-0-bc132dc5fc30@fairphone.com>
In-Reply-To: <20231201-sc7280-venus-pas-v3-0-bc132dc5fc30@fairphone.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Not all SC7280 devices ship with ChromeOS firmware. Other devices need
PAS for image authentication. That requires the predefined virtual
address ranges to be passed via scm calls. Define them to enable Venus
on non-CrOS SC7280 devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 9cffe975581b..a712dd4f02a5 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -881,6 +881,10 @@ static const struct venus_resources sc7280_res = {
 	.vmem_size = 0,
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
+	.cp_start = 0,
+	.cp_size = 0x25800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/vpu-2.0/venus.mbn",
 };
 

-- 
2.43.0

