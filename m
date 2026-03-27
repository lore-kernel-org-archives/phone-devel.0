Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61A7345CA3
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627955; cv=none; b=eQuuKyPuPnWgf8HWfFh09KR8cEqEkj/Bctoe9bhd4cJtF4QMCwa0hBLzVx5kaVp3M/47oxzpZdyoaxpCci2hxoW1y39fdWPC5t8gMTP0FMBxhoEJXmX4tYck+Uvdbyo40BqVwlrs7nHa5EOHCaPvB9Qufzxi8sjIs17id97uFDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627955; c=relaxed/simple;
	bh=EVldcqfPHPh1FF7QDMATcvXChGeMKnSCWknhWuq45Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RuA2CW6mDD4tJMbr1MjRl9odFicsBzVb4ByExZhfJdyJhdaEn2K7hQfifOoFK01wNJg9SDtx+AmC0ZeTx0h+WYAJjlRYop2Iv7IEJiGKmiXtGA3MnwOq//+x/BQdGXptgLlxEiyn/x2TNxbru+7+ntfwqyl7zwts8AuNVIV+2vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tA6PcHQS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tA6PcHQS"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9358dd7f79so414355666b.1
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627952; x=1775232752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14WR76NKv1FwsEs5HwWnn4/wFMyJv3sPwC6I4w0TIdQ=;
        b=tA6PcHQSbC/RMSxXLjam9E7mpvXP3D9b25yixemJAXB4nvsCKv74vE7TjGLujl6On7
         57tzAbQUyLFWqACgxCM+Ccs0DyXbbLm7k6WJafDaPWWHkahi5zisj1qxNswgsHknmt6t
         fDn/bw0wXxIg+/6tibOB5A8NHZaY+9WKsTww41xrZnbwwcip9LpUmgKzQg/k4UjFWo7d
         ZAK41GM6qXHVl1nNQ2kPDL3MkQPrgsA4rCK3C31GnfbZ3zbS9uMpLKFIYuvWxLeobGv8
         qlpFscXk4tvubEOsHhHSn7NQmiTRIWtTIQr8tK49fIv5re4vjIbr1DEMnjDZ2SD6TvJx
         8Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627952; x=1775232752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=14WR76NKv1FwsEs5HwWnn4/wFMyJv3sPwC6I4w0TIdQ=;
        b=DX/aCHDnT/X9rDew89fHojvzDwOcV/U6Hmif0PfQ8yTVvMTvDh2q8YKOpIo3LKmVKo
         UZNrP1mKeowEZL0EtGNrrmIYla8CRQrmG8GJxUXEvvTuP+y00ZOUD7HhB0aq7SMSIZty
         Ge6N6CVD/qiKT5Lz6Seewz/RaRUGTNaCKhLtMAOb9D1H4IP4qNy2c+jZ5vsc7CxSLAho
         AEyx8NkiTpoRjzOoU+zSc7DNivud655lstMTa5tfxxOPQax9ck69MgEWLBTKmjpoSZK5
         DO0Gw105teq/3brrwUAWYxf1zMIgE7MR2cCVFI/GJgSD9ev/i82QUdFN8XGgD3GMpIyx
         rOGw==
X-Forwarded-Encrypted: i=1; AJvYcCWHVCNOx7QRcD5hVhnhuH7nN4sQuq+0xTx8yVXZ7TNuO/bXFMeT0vqXmi9f9bykAjNmzGaTjkHOmCGh4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZy6gvEpt5kDR1Xfg1VXkvQIOTB8E7lgikI6w6OM89b6SF+QR
	lfqNSLL6Dh8CfMtdyEazi4DlN7Qeq17h3vcJRaYdZKEocDUxveqjzLvYjDeT2G1UKSE=
X-Gm-Gg: ATEYQzy6WVnmv559yQ8s7IQPFP958NqL4P8SHa7LcwQWYgYWNIkx7q+ylyLQKj27Wyz
	A5IR3I6iDRWtUT1yX6tpT1UFwuD0oKIHnGnpkbsK0iI/CuAjQ5oh8caBWv4F1SJYdsuLI/YFh2E
	Pwvm5ZvGJP7XUpKBkdUwlGG3meaZrzSttdHNgUhI7GwnqCaZRy6IJYHis4lpp667RaFayTNLKjV
	5BHxAkXTFvTE+09f2mpYEB4mycWIKLzem40IkEEMc5vCP30xlCij9eL6X97PRWL2MBhpQuClzdZ
	UdodHjC64h17MsB9xakZUVXbEAM2Creh5YUBDJdfR1yNdI6nZdIXwO/dwKQWJkWQbcUFbfyK1sp
	QE9qeJ06I+8hVb54gfRWZNyww4dqIXkycVk0MERtFbY0xbPxfJkCpxwnAj/7m3+f9nbJ2St7bqQ
	BjR4bbbDtgZNEhr4t9+bbOvTmuV4cjcrw2BdXDIJd+6Q7ER7KmaRnZiAFNlsglJHfLTGxgPId96
	w2nyg==
X-Received: by 2002:a17:907:3e97:b0:b98:b51:6f51 with SMTP id a640c23a62f3a-b9b507a58c4mr241007366b.35.1774627952065;
        Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:20 +0100
Subject: [PATCH v2 1/9] dt-bindings: display: msm-dsi-phy-7nm: document the
 Milos DSI PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-1-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=871;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=EVldcqfPHPh1FF7QDMATcvXChGeMKnSCWknhWuq45Jg=;
 b=7Xs0w2eewxL5CZRI6DTsd3patfJnGDWajpneO0Gb7M04cO2ebwe9xVRUTwB/8n4ryA6yQf4XM
 Wst+Ph1T2SSBnUcinUWrXd3lqAzF+0vVz4Pe5oq0O1dNKX+diUB1slP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the DSI PHY on the Milos Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index b5a0c1461250..4bdec236734c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -20,6 +20,7 @@ properties:
               - qcom,dsi-phy-7nm
               - qcom,dsi-phy-7nm-8150
               - qcom,kaanapali-dsi-phy-3nm
+              - qcom,milos-dsi-phy-4nm
               - qcom,sa8775p-dsi-phy-5nm
               - qcom,sar2130p-dsi-phy-5nm
               - qcom,sc7280-dsi-phy-7nm

-- 
2.53.0

