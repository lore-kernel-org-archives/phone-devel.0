Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD81CD13CF
	for <phone-devel@archiver.kernel.org>; Sun, 17 Sep 2023 13:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjIQNRp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 17 Sep 2023 09:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbjIQNRR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 17 Sep 2023 09:17:17 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF7A12C
        for <phone-devel@vger.kernel.org>; Sun, 17 Sep 2023 06:17:11 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401da71b85eso39966035e9.1
        for <phone-devel@vger.kernel.org>; Sun, 17 Sep 2023 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1694956629; x=1695561429; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mgpgf51WlJtHJV0Rp4UXo+NI5qfPAJ/I7UubaP6q1W0=;
        b=HSAn/xV3NFP79uUDNIRz1ybJZCEfgQKNnYdZKck835lpjI3KWZFAKgCi/ES2ivJEOO
         bIbzPUPQSsPlwIDTN1ysE53v3V3/2rGqBCNb+JDQsfikQoS6TNgiuTOuX1viX/jSUSDk
         czmARCwXjXJ9dOaSPwUI5IGl0ZBTP5gEo2xvW45NPRF6FA4DGGbI3goCs5FZXcxifyKB
         CyfjxoDA7T2eNtbaoD1j7iXAWSYNSp6LR5p++35HRjSji2ClbU30z4pttcR3FVsIvs3H
         2MEVf5/Tz8d+iKHNM8UjH1ZTLtE/p+vlwKmMiAokwG5DSvmlsORiM+JrLHiwO5WT8TE6
         8bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694956629; x=1695561429;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mgpgf51WlJtHJV0Rp4UXo+NI5qfPAJ/I7UubaP6q1W0=;
        b=tzg4c3b0QVtP4AY31SKKzzCxChMlwL8Io95v5G2BalmwS9Ktr5ZYsPYLGBiVULE//4
         E4TDnEoR3sn7w/XTzuXt+dHSu8lRoeqXd6eRWNxUbjCPYeE8NsNp3BDyH58BRcS/J18x
         sr8zazcCPzCN3oC0MUR5pPQqMPGOeGJ2meqbirvu25Btx7mjNdCSlrt+j38Q60a5Jq68
         jpPC++reBZifLMSrjyqIUvMOf/wfikpcIf3BoWVNEdEGfu2pbhHI6Nmw8RboPo70m91n
         CpI4WLkYdo7Z6bZaON5q0/jNZ3bVCHz62nOeFKQ6+n86jtDLWD8E2Uw8PM2Gr63hf5oY
         lNCQ==
X-Gm-Message-State: AOJu0YxpW5Ct86YKQ6ERB1tiMMqHWIrB7ajaVq+Nap01iYHp6Xd7qUwa
        24I561w9rH4kemJjSoLJhX4ggg==
X-Google-Smtp-Source: AGHT+IHbddY4ACq7Zaot0S6FIVRIu0s/oobjuCpymDfmDT0A3OCnmkbaFe1yKVSrYn7lFvxvXBA0gw==
X-Received: by 2002:a1c:f30a:0:b0:402:ea96:c09a with SMTP id q10-20020a1cf30a000000b00402ea96c09amr5889645wmq.16.1694956629493;
        Sun, 17 Sep 2023 06:17:09 -0700 (PDT)
Received: from ?IPv6:2a02:8070:d84:9160:acd3:26fc:724e:a2dd? ([2a02:8070:d84:9160:acd3:26fc:724e:a2dd])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b0031c5dda3aedsm9779189wrs.95.2023.09.17.06.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 06:17:09 -0700 (PDT)
Message-ID: <c8168e781f3fc55f594f0c85501c480db5176497.camel@aceart.de>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
From:   lukas walter <lukas.walter@aceart.de>
To:     krzysztof.kozlowski@linaro.org
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lukas.walter@aceart.de,
        phone-devel@vger.kernel.org, raymondhackley@protonmail.com,
        robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date:   Sun, 17 Sep 2023 15:17:08 +0200
In-Reply-To: <bd833cee-2349-368d-93a4-9465ebc8a0e9@linaro.org>
Organization: aceArt GmbH
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


>Order of SoB is unusual. Who did what here?

I created the dts and they update the model name. So it should be the
other way around
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEi1ngOOsyNO1iyMXiY16HCsLx2zUFAmUG/FQACgkQY16HCsLx
2zXbug//cFZNScSBr6k1I4tHuthR2+CFhTqOO0x0EqMa6W+l96s7ZimJA8UGq2jJ
F+4BZHujtBlpd1p4bE/GMDERy6MMHmAW7/N8kl3dEfwErwvjwML4nvDLRSC2Movd
93MNJ+4tncTndMLUEyARUUg5sP6Idgc/83pMRzKn4toFxWMHfWPFHy5XlNLDjJT5
/BuvYlbAFpme9ZavTLMGtalOp6ovsS1qNRrNk/CZecV+I5tCVFs4ZbzMHf8vKi3/
B7yObHRsZEdy80KE77kedgyBlGWu0/Tvu7xrK2qZxawkbraLBn+qE76wCmgk91qg
7EheFFr30v1LuudZbA+5fOE3qC13u3LbmCaRwwKAC8S7C6OgMM8Vcg08rPdaaV10
m1MDSPgxddA/TitQNz3epvFahpm1WWuGhR2xihDP/r345kogUYcRiLw4eqIkYKjb
64Wgalclq8XByymGLndYuoBaR31wauOjCtShiHByRTp86XTWh9C+KJ2wVGdE2UWL
ok+qs1hrao328+FtgtZn7FxnmO2yLA9I6xLeEPgTSt5VSZ9NWpRNQ5h61AYDEaZV
YPy3cTJV5VN5Mrp6dul7bT/Ti5rp8tCH5zk6D62WTSq2xEzkDtjnE1DKzr2+0KNt
c2VZQGmquTiTotnQF2c4E2M9ONd+TxN9sn0dYqwwZa0BLEI1JBk=3D
=3DF2cY
-----END PGP SIGNATURE-----
