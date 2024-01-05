Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3332E623
	for <phone-devel@vger.kernel.org>; Fri,  5 Jan 2024 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lald7/Ga"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26f73732c5so177748666b.3
        for <phone-devel@vger.kernel.org>; Fri, 05 Jan 2024 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704466480; x=1705071280; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAo+/5UMblvp2yGXfA0v9Z3b5D8zBuz/YoaB+OeYIrE=;
        b=lald7/GaAyTUCwVUEZ6z7eP92qUZpWqcnu5KxcLCAgE2j8yjdFgC2fHq1yGVmbRaXY
         89/slULpx1vhC4bu4pPJPW7IlfOFSQ7mWsICxLiuvky6hWGvhDJeLjgLJM077nRd91kS
         +L1rvhaaAOCridAotqXSlt/gHs0VAofWjTfiWD8/oLCJTU2/n9ugYJ7a1zrf4/xP1B2V
         6zt0ynwHYV+CFljq0ItChIgZLnYeQncihCeDe/ENZpvuaqxFwJgadyLieEu3/Z0gpf+a
         Z7XnwUCmkW6wT4wKC4fseluMyIktJCOSfbGQjff81w0nPXoD1Ou/PmiKSHlprKVHXXKF
         WE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704466480; x=1705071280;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAo+/5UMblvp2yGXfA0v9Z3b5D8zBuz/YoaB+OeYIrE=;
        b=OtJr6bgWXYgw9b0AG2D5QLY7/34ez/N2x87EjsYuzqsfYAy2S0sM7i/mi6HttXrINU
         Oec1dibbtJfbiSCQzbjlv9SxRv3GvLh8dM48nSz5ILFekvamPGQJ60QbQBVvnv+/o0Tg
         h8MV3wBtrPKRSx1cchgK85liGojcj5j2R/VeKgVJ3h/RaZnbDv5++q4Q6XlwBbQNJ+JS
         wxq+HtCOHcBbKQR8n1n4V0cxD6v0STigwPl4Li1+ORKWSEJe36U47Llc5HExCy96xDHh
         PKZIjp1YIfVuGNCwqFOw4+pMDexDnApAcb74zXYTeysWjuLQ+T24dNIUB/DD5y+BrjCm
         VALw==
X-Gm-Message-State: AOJu0YyzudBFjX1+IaaRcHtFz44EZRxFZVYopHLIF35dUPoM0fT1Vt0F
	sdJD32avE4t9LYezcUxdyfGPTuU2SH7Bvg==
X-Google-Smtp-Source: AGHT+IGn+Y4YT3T2PJ4K147KHuH6YnDPE1udmtzVWQPQsBZaJbBPCebO8Q7GFNHFzPX14gOS0yomTg==
X-Received: by 2002:a17:906:6d3:b0:a28:5597:6253 with SMTP id v19-20020a17090606d300b00a2855976253mr1171606ejb.21.1704466479847;
        Fri, 05 Jan 2024 06:54:39 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a17-20020a1709065f9100b00a2471bb0d11sm963140eju.31.2024.01.05.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:54:39 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] More thermal configuration for Fairphone 4
Date: Fri, 05 Jan 2024 15:54:26 +0100
Message-Id: <20240105-fp4-thermals-v1-0-f95875a536b7@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIYmGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQwNT3bQCE92SjNSi3MScYt0042SLVAMTQ/MkcwMloJaCotS0zAqwcdG
 xtbUAFbh4wV4AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add the thermal configuration for the thermistors connected to PMK8003
and PM6150L. With that all the external thermistors on the phone should
be present in the dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: sm7225-fairphone-fp4: Add PMK8003 thermals
      arm64: dts: qcom: sm7225-fairphone-fp4: Add PM6150L thermals

 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 216 ++++++++++++++++++++++
 1 file changed, 216 insertions(+)
---
base-commit: 50c107ee601a3d57e4fb13a9ecd9cf6c8df187f2
change-id: 20240105-fp4-thermals-f3c8e0417b70

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

