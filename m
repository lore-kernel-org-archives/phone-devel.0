Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4269E00
	for <phone-devel@vger.kernel.org>; Fri, 29 Mar 2024 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711715185; cv=none; b=EzpppuXdRc+yksR17AREE2yd2T2pOHJMbRCnPAFyFCXzM+R1RLhMAnszFoWMJkg6n6QM5xX0SuE8Xv9ywteAqt/fXNqISDnhjNkXOowidU2a1OCwll3n1icrXt1ihIGTPC5ORNOuRIyMaeajRyA7RudPsuSDTgg1G2/O4Th9c1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711715185; c=relaxed/simple;
	bh=3VWjCOa5b4hmLY3eM1N7yaUqMm4Psxq4eZLprcN78ns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lWiWpGl4LYOtVygi8UUcZNXmDpWQNTtuDAZOQlaUcxTPb+Wd0lsKrsJ20O/2eHdu1H3uHLnHyIOQF5XGnvVpeq4FI3zs9RpW0rww8kWS+SVGtipXxhKXQMYr7nRtZpwCISB3rYjTx65mwwtLxHWrI19vai3nfjIuyTrjRoRIrdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=W3Nty7Au; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="W3Nty7Au"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c1364ff79so2317407a12.1
        for <phone-devel@vger.kernel.org>; Fri, 29 Mar 2024 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711715181; x=1712319981; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFvJZ+2psODEep45ngZKqrqa301yt2Mc1MN4ieVjABs=;
        b=W3Nty7AuDqDOUcgUvOog+F6jbvVjkBHAESkL50LAaES3MoxS0zqLo2SxI0r1fICm4r
         WG/3mKcVGrKsPCwaCDi9VU1Hu3EGMCUq7IUvgmb9aDbXtVde/eJvJgqpcLPsVt3ENWoD
         n2umiX500JjbG00GQ5J2k6f52ZGBNZC0ezBIrVhLKJ0GFdG4fUvAlIv5Ewo82dc3RNwu
         lsDn48Pee6QqIeyCYdhAiLcvX7TPMM3mbze0b+6kEN8zexWtiKLvChauQUJENNweIRjV
         e+EBzxmXbROitz/0AHVYiKFIBNGuAaPIOH5iI0VEv7Jc7Y1roAJFj1dh3uTQ3/AV1d+e
         uqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711715181; x=1712319981;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFvJZ+2psODEep45ngZKqrqa301yt2Mc1MN4ieVjABs=;
        b=nGoiKIOPD+XvO+8kIOF437ig20JY1LpRYH+wAVf8haAMM425p/i2brYI54LYhLT459
         s7hC3S+OPtoNc1oMsvMNyJbwe9Q9dCZf5LfnqoSCTMANcgK91CGCTdGBWoGVzzuv03Ow
         BBhGAiOTKeJ7GpKJXwyLDq+5uwbzjgEEFYcnfi7MR9u8holNIzxLI/QWqX+oPMI8neOw
         XamieC9rbDBfy5tpVq8R/Z5c8fM9C3bGBR7dfvmRMDD+loKZoU4v55dtzEKrVD3AFOx+
         JKH7b2TpucqdhsnHqQLv+j0OuaqSXAkvY2rv9iEjwSprg/HA2JUaleyzv8t3yNY3LLJQ
         Hm+A==
X-Forwarded-Encrypted: i=1; AJvYcCWbPAAXzzfpPvRK+c1uTnz2qbk411cVL5k5C7S2kRA0mhBm065GuUP6KMQl0Csj1hkVY8qkQ2GYuIA8HCuXwQoRV1/yn1USk/lQez0=
X-Gm-Message-State: AOJu0YzFoqz3h6auEHHNIuvhdvloM5SjmCDosFiHL3LFDKVSYVVeTFvy
	22rgrvDR42irQtENpR+lmh/bEcaE9TgPvW3bpScse7qZjZWevQi2Kuo9XHg9tB8=
X-Google-Smtp-Source: AGHT+IGI1ORl4PM2xAAAC2sqhJuE1zJe22zJe66hKQmZg2EvgxzJUiXS3txvz7hOrxTmxG+CdQdMbQ==
X-Received: by 2002:a05:6402:520c:b0:567:ff26:4bcb with SMTP id s12-20020a056402520c00b00567ff264bcbmr1785912edd.30.1711715181416;
        Fri, 29 Mar 2024 05:26:21 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id m7-20020aa7c487000000b0056bf2e2c898sm1961925edq.1.2024.03.29.05.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 05:26:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Add TCPM support for PM7250B and Fairphone 4
Date: Fri, 29 Mar 2024 13:26:18 +0100
Message-Id: <20240329-fp4-tcpm-v2-0-d7f8cd165355@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqzBmYC/23MQQ7CIBCF4as0sxZDp1CtK+9huqh0kFkUCDSNp
 uHuYtcu/5eXb4dMiSnDrdkh0caZg6+BpwaMm/yLBM+1ASUq2SEKG5VYTVwETnN/Jat1p3qo95j
 I8vugHmNtx3kN6XPIW/tb/yBbK6QwuldKDsOsL8+7nThFFzydTVhgLKV8AWbyrrakAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0

This series adds support for Type-C Port Management on the Fairphone 4
which enables USB role switching and orientation switching.

This enables a user for example to plug in a USB stick or a USB keyboard
to the Type-C port.

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht
Cc: phone-devel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Changes in v2:
- Move disabled as last property for pm7250b_vbus
- Update USB graph to newer version, connect both HS and SS signals
- Update FP4 Type-C properties, try to keep phone charging intact by
  disabling USB PD for now
- Pick up tags
- Drop patches that landed in linux-next already
- Link to v1: https://lore.kernel.org/r/20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com

---
Luca Weiss (3):
      arm64: dts: qcom: pm7250b: Add node for PMIC VBUS booster
      arm64: dts: qcom: pm7250b: Add a TCPM description
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB role switching

 arch/arm64/boot/dts/qcom/pm7250b.dtsi             | 45 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi              | 47 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 60 ++++++++++++++++++++++-
 3 files changed, 151 insertions(+), 1 deletion(-)
---
base-commit: f3583a292140e0a2a2ca0ae0019108401b4c9158
change-id: 20240322-fp4-tcpm-2ad68ef55346

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

