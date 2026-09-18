Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B2649DBB9
	for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742419; cv=none; b=XOp4u5l/jhaai17ogJHuUtVbPPxa9uoykGrKFRRAC37+HiOeMTXSMVM2tQm9qcuR6hk8HQSJAqaR6hGKLYR0wHjqVE3ubQKdCTOKFv7IcdA1spSG3UnX7kOfjkHsKl/nvx/f1WfFoEJLC7cKUhnmGzuOrbiUSBdn4TAkJ2SNXzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742419; c=relaxed/simple;
	bh=3l/OQDwilslojwbD5BIFc247psV75whhicTp80W21k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3nDZlb7fP2Nh4bEkqNPu3iq7GOXXmy8NtZfPPNOQsd/VJfwTNoUSb0fxy7XUgN+7wBOAryF0TTcwswvdhvHVifBePgKbkMjmTpXtTD5AT0ogcORVj95CJgASpsdE8cp2XFM3JcFZVqsQsaklkWh0TZ6yNR0ztG7bvMO1vXLypU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mGXQW/ha; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mGXQW/ha"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1f611461so39783866b.1
        for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742411; x=1790347211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NswcxVnJHltqSQeVprb1zCpwdatT8Ku5jmJgLkP1CTk=;
        b=mGXQW/haFJ8L4Zxx9ZyDk6vrHPZhwTsoIA0B2l0CzcNBY6ScYlmRbCnlDtVozEzeeC
         k/k75CQtpmf7vNXe4o9c1lQQv8I/AJVgjBlO0nIj1XDYyQi8B3x+PjSLyk5PR0YLwll/
         kUimCcT4lv533FFcA/27s980FF7rlpuA1LsiXUJW67M8HIzRtMQJxRtpkreJS98kcp8Z
         zpjqecHuaQqnm8l/kgYZLCbD6B5YKdCkbl2RSHs+DklzBr26AAS7Bcd4TH6Xf2kU7M6d
         UEm8enq4WJPkMXimahu0/8ykjTGenQU8swr47JL+WvImHvEKhQ5pv5JjI2XSsZSk8Fsm
         PXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742411; x=1790347211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NswcxVnJHltqSQeVprb1zCpwdatT8Ku5jmJgLkP1CTk=;
        b=NXWaiszjpvVbQCVLapvY7fiRlsQqpEtQKZx0KxiouMxjIpQnZAwrEMZT9eywwGj/SG
         YmlFbBvsCX1WBfdOAalah3T3JDQPZ0zJu8SLL20C+wCs6SGZq5xo+3JqfFTytC/nZori
         rxstjM3kSnbo/OyadZCDS1l42X3j+AYkAOcydxnHdlgEqXG8LVEMUSa4wD3cVLZF4UWt
         zGXAaXAUV4BW/liJjVHw5o6ssWY4htbWz8ZBOUn4IaXKE9QsXC8BjWSzzFT9ECU7Cr69
         1zQdOonoFxGJi7lTxTQ5YNZ+zuiuosrtMR7tTIqwIH35dkrGozMErVFur1nhegQntSNi
         7ZxA==
X-Forwarded-Encrypted: i=1; AKwUvBwUUPJI1hLXnIPbe/js9rYqINMcs2tu7j4HtOObUySIXPubZu0tadDreQjyJirUO6fpPQ/jJoQOHDN7tA==@vger.kernel.org
X-Gm-Message-State: AFuF++nXU+2TLQvXtYhdDiNF9XbBbSQwlknLIgirvmk9cILlQQTLtYNB
	oNrimr4Ocoi8+gz10GEid0U+QW/XuVcl0zzwkYdHN/EMV7s2jJT4uUSKkEr/bAb+b3GF0bIZ06s
	TrY4l
X-Gm-Gg: AYBFou2ZWftQHdripwJvRa8Pa8A1Sy5DT7Ykxlyhvopjz9dQfBS2XL47N4vBhonGb16
	lnNTKqAIq1+XZPtfRTI1kVWeqNgxlyYSOXJ3mwAiNgcZ0IB1pPH2w0dU3jfgdZbftlG3kqSdlw/
	wM0gf07vs+GCsq16YOwJ5xwtq0w5tymrsUu3B1JC0DF46KT0o8ZRM1KXHDBLzoVPGdYh7TeMOu2
	hQ8tQhRen8iA46qWNcbfxuPcFPu5BwDr9Py/qp5CfYm5kQSP5936nkRnJ7KXMAWfsSiNs8qi9UF
	XTakkYgRfIInBMAfwkcktEykbXcxELk7WdX9mgRWKjJIw9gcrZCJD3VT0hepNtZdUTX5gzDd4da
	nIju53Ez4PvMukrTOT1tHO9YqkH4zEhQAN7cvE7b4hlXJibzUWC97ZUikg5utnBsGeOZt3HJk4P
	qICmSOL7aeHnOdc7RLMV4DWsIaP/NNrH0kOGjusU13Kqu9ZkTdIddQDuKOk9sE0L7II+4lyxP87
	PpPYInqtERBqctdILIIVk5MrTCIWtzU1XdaN7871HESolGlCcojx8Dg57y6F1o=
X-Received: by 2002:a17:907:940e:b0:c25:f7db:4bee with SMTP id a640c23a62f3a-c2a16599060mr289750966b.20.1789742411235;
        Fri, 18 Sep 2026 07:40:11 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a369esm64244966b.9.2026.09.18.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:40:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 16:40:06 +0200
Subject: [PATCH v2 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-fp6-panel-v2-3-6695c4008920@fairphone.com>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
In-Reply-To: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789742407; l=791;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3l/OQDwilslojwbD5BIFc247psV75whhicTp80W21k0=;
 b=2eQL9cFuNTxwCukWgu2TjmmlCNjhR6F0B1X3ayynoF3nwFPzUq2NjIk7TXGfPbqRIFTes6+Wk
 HPbCfn9gLI+BWPQNPwdbR2gfL9qAb8MskNf5dl3aQMt1aV9uYhBn2gb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..1d4afc733c8a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.55.0

