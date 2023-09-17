Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE51CD13CF
	for <phone-devel@archiver.kernel.org>; Sun, 17 Sep 2023 13:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbjIQNU5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 17 Sep 2023 09:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjIQNUm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 17 Sep 2023 09:20:42 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9622E12C
        for <phone-devel@vger.kernel.org>; Sun, 17 Sep 2023 06:20:37 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-401da71b85eso39983495e9.1
        for <phone-devel@vger.kernel.org>; Sun, 17 Sep 2023 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1694956836; x=1695561636; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KeYIqn2tdFkcVAufe9gBvH8l2EIbPxMaLKSc9nvnSeI=;
        b=fGP/lbeOLDw9ka7WpYIOuuqmh2b0qkPdH4OKothbxnK3awDnxiGkVXPoqDUU4I9Bbh
         gHibX/usDnz6WHH2BHTYY6hKXtmwJaoLJJwJO+eP1isLelK6Cv0rlx8qXE1PIHe3RdpE
         XcENRMZei5ZaA5Fvoxugqi3n5axgIOIQQUdZgJjIe55D6YnWB74vgmU96fCdQHdgoCok
         9yl9FQBmzI4Cb/Ma8gdsOlXtdfw/w5wBdHZckbjoPkE7y3vlsdmHnAzaOXU/WePYx+Ti
         PZ4/2YQYNzvM6VH5IR8i9KlD7lXZJoBbqf30HE2nsZFJv5cbe0038aHxi4mRLphfmfVl
         CTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694956836; x=1695561636;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeYIqn2tdFkcVAufe9gBvH8l2EIbPxMaLKSc9nvnSeI=;
        b=kFnRMjGwg4MMmzBTE9Q82V0+JnSfOB45y3TdjmMBEz+PUgtRy3AoNVyxX3OoNDrMI+
         i/WoF5GHecwOegbqYK1auc/AUVAGdDfZ/mqsdNr9Me+1XFWwut8fiOtTsCYNPhYT7sas
         S3t6NBE0+USTBc/NU/7zcwwx58E6gm+CZox4fazcf7rpr8ERzi+jfKfIIr86JYXqp2EY
         T9MUhwGphAUVcObCaZEpPLjpBd6lUxF4gblM8bTi5uq7iq7SuL0Z3dtqERHVe6UQJ6ml
         YcDsqeLuZPVVlqUGykY0fiRvLJtBTbYYynnZ+KidZ5Znt/xEgB9CSgXhKbHXlJ+DUz8t
         DkhQ==
X-Gm-Message-State: AOJu0YzVsI5nrlb1ORJux8Q0uzs+pB8U/qKCGCLUsqejOPIt19l+Ssji
        ivfjG8pOLEgguyhCwSkpJ5l9fg==
X-Google-Smtp-Source: AGHT+IH4ywV4aEv+TpxbpFW30ZsBFhptGh4bDnt8s/U1O/3wFXPg4T07xR32tTPSdkwu/HFEYDVc2A==
X-Received: by 2002:a05:600c:2901:b0:401:906b:7e9d with SMTP id i1-20020a05600c290100b00401906b7e9dmr6226687wmd.18.1694956835911;
        Sun, 17 Sep 2023 06:20:35 -0700 (PDT)
Received: from ?IPv6:2a02:8070:d84:9160:acd3:26fc:724e:a2dd? ([2a02:8070:d84:9160:acd3:26fc:724e:a2dd])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c320900b00404732ad815sm8936077wmp.42.2023.09.17.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 06:20:35 -0700 (PDT)
Message-ID: <dd0f65048f7030184caad4d99b8277d589c6d352.camel@aceart.de>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
From:   lukas walter <lukas.walter@aceart.de>
To:     bryan.odonoghue@linaro.org
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, lukas.walter@aceart.de,
        phone-devel@vger.kernel.org, raymondhackley@protonmail.com,
        robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date:   Sun, 17 Sep 2023 15:20:34 +0200
In-Reply-To: <3a66a198-5817-4c74-9047-c49e5bcc84c2@linaro.org>
Organization: aceArt GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


>Are you sure this is 3620, have you tried wcn3660 and/or wcn3680 ?

I am sure. Downstream source [1] and downstream dmesg (wcnss: IRIS Reg:
51120004 which should equal [2]) indicate 3620 (3620A does not exist)

[1]:
https://github.com/CyanogenMod/android_kernel_huawei_kiwi/blob/cm-14.1/arch=
/arm/boot/dts/qcom/huawei_msm8939_kiw_al20_vb/huawei-bt.dtsi#L5
[2]:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817e=
c874f325127b07609fbaeb8/drivers/net/wireless/wcnss/wcnss_vreg.c#L51
