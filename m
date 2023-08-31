Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB678C83F32
	for <phone-devel@archiver.kernel.org>; Thu, 31 Aug 2023 11:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245278AbjHaL2I (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 31 Aug 2023 07:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbjHaL2H (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 31 Aug 2023 07:28:07 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CA3CF9
        for <phone-devel@vger.kernel.org>; Thu, 31 Aug 2023 04:28:04 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9a21b6d105cso78501566b.3
        for <phone-devel@vger.kernel.org>; Thu, 31 Aug 2023 04:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693481283; x=1694086083; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yvHyjPG7qUuINUCRplJZoEcbwB6qImIpL5RY/TwBK8=;
        b=gJPowC5T5XnE2dRfmE1HYdTrXIJUiGjy10McutUK/lhG2Hl2hrLyYC2sp5NqioJr4v
         aF5VY/zgu882zOxp2UY6NEGyBiVPXUXRa3rP+ZWNtKWn+e+b+hFtOgzziUNE4AG5wOTx
         Qvw9OP58Y5qNHW39HdGvLzNBtzDrKh9xWVUtiv1tsKe45f8yIqrFPns17Cer45bskcwo
         4xcWiy7Z6lz8OfaGc+inoTw34CxFSYyweK2WUKp1lI0qy8GPpbCiG4xFEsyuU5eAOn2C
         LKJDMxe4ZdLjwoTvAQLXPDz6fgOLR+DLe4eJ4zjPc9+2VyexjSJuSHwj4qQgPdt3XNPe
         dfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693481283; x=1694086083;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9yvHyjPG7qUuINUCRplJZoEcbwB6qImIpL5RY/TwBK8=;
        b=TSmgriJT+XB4XHBLU7U36SXChsD5TBBCwShcnwdcgdZjSaXU0X0vvwyDtcdk5+RdMd
         yu0yv0t1FGmw8XgWg8eF6qEa/Km8WgJ8yq4YI4+GySBvZG5/A3x5SdPuv+y0mR8lSVKv
         ikFWfotrWBMh2URIp7166+T0FwL/aNsgLpDGNcxVCm7D0G9TXflDKyJG2l/unYerYWa+
         W6XbFW2eZOiJ1DVIYrf2UuOezZ71z0bCq4QBf8NiM/KCLzT6XhdKFcWVhx51d9oMZyiq
         A3a0uAqjYK1MNyv3J55j/+HRSsK244i40+FE6mSWKuiY4OyRCrS70IrRTN3aBpl/dKQU
         NpqQ==
X-Gm-Message-State: AOJu0YzJur+yDf2YLinThZTFzj26nYWrRl84hdo8w2w72qgn+pTipX5A
        2W1jyRBxTHjHwDSYvTeJHO8cvw==
X-Google-Smtp-Source: AGHT+IG/hpDsEDtftxv8WRfScAb1QpBlf4Zc8+8cS6j6PB4BK2HHNwPv823nbljA1+JmHjuosy8iUw==
X-Received: by 2002:a17:906:3195:b0:9a5:c49e:7145 with SMTP id 21-20020a170906319500b009a5c49e7145mr3734010ejy.69.1693481282782;
        Thu, 31 Aug 2023 04:28:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id r10-20020a170906c28a00b0099297782aa9sm655606ejz.49.2023.08.31.04.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 04:28:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 31 Aug 2023 13:28:01 +0200
Message-Id: <CV6P0GSF8HWI.1I9L17HVQA7CJ@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sc7280: Move qfprom clock to
 chrome-common
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-3-5a954519bbad@fairphone.com>
 <0ab29903-9861-4736-b827-5dd45b504baa@linaro.org>
In-Reply-To: <0ab29903-9861-4736-b827-5dd45b504baa@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed Aug 30, 2023 at 12:09 PM CEST, Konrad Dybcio wrote:
> On 30.08.2023 11:58, Luca Weiss wrote:
> > On non-ChromeOS boards the clock cannot be touched, so move it in the
> > chrome-common dtsi which is the only place where it's needed.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> If that clock is not registered (e.g. it's in protected-clocks =3D <>,
> would the _optional handler not handle it just fine?

Right, that appears to work!

~ # ls -d /sys/bus/platform/drivers/qcom,qfprom/*.efuse
/sys/bus/platform/drivers/qcom,qfprom/784000.efuse
~ # cat /sys/firmware/devicetree/base/soc@0/efuse@784000/clock-names; echo
core
~ # hexdump -C /sys/firmware/devicetree/base/soc@0/efuse@784000/clocks
00000000  00 00 00 03 00 00 00 b8                           |........|
00000008

Never tested this case before, but since it appears to work with the
patched qfprom driver (other patch in this series) I think we can drop
this patch.
Will also have to adjust some other patches in my local tree then that
do similar things ;)

Regards
Luca

>
> Konrad

