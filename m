Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20407C433F5
	for <phone-devel@archiver.kernel.org>; Fri,  8 Apr 2022 11:25:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbiDHL1D (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 8 Apr 2022 07:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234823AbiDHL0x (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 8 Apr 2022 07:26:53 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D893139166
        for <phone-devel@vger.kernel.org>; Fri,  8 Apr 2022 04:24:46 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id qh7so16600544ejb.11
        for <phone-devel@vger.kernel.org>; Fri, 08 Apr 2022 04:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=JB/CC7Ec3Hb4OFGT9SZA55npXZ1ZkvCNi/Sf1qgDY2g=;
        b=EGJkYNDtG1rZUMJh9xXvZEpBljzhh7xVHW+qntSTHQ47vn8Gfqgnz7rO2M7nglYh+O
         buNGI+A1uRjTH+HU4p3mJW4bmSa0whlUFjXAa7BawVguWDsmo0wpl9KA3ONSArzPWqOF
         OESxAPTmt9r5/kWVksICuU9X97GoyPdZNxUHhQ7AM5rxjEI3wZPq1GfxgvyRuL5AV1gz
         ijuPrbd583+AFbFzQPY+Eb7IVwk24g6fzUTNzsduEep6aJ8J46hExo7YFhnss713ATm0
         ItwzcarpZrcdTRiSxxE2B2QyMvAzQCX7cu4U2ocU2g8sxKGSkvxZi+NAkHCyKVDwuZN9
         1kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=JB/CC7Ec3Hb4OFGT9SZA55npXZ1ZkvCNi/Sf1qgDY2g=;
        b=fu/h6VHr6FaB6Iq/9uvo0XOPeJtLcKJPKsUY9uYst/j2xqzRXHT3S74SGCEP+uOzjx
         tcGnEkzj4sj1ckpwZRerY8BZpF8jnZbVUTzfyhpec5e2iFvaNDYctb1NfM1sy7+AdzHK
         TxYSfj4kIk3hkZi5RrfKnQcZXN5lHyancJ5urG5OPtgf4Ha2UUoF8Jp87mH7WnFoxa2h
         oQ0Fp7p7pfWMc8rydBSWNjUddI+nNNEF9E6XsTYC+gFgh4LeQKb1NBR6yypJu3hPd1t1
         3Lmdc2zPOHKrxShuGCYHn5eUjMAF7PL8jqyXskuJa/8VBVH7Sw3w8XjMSVsSYOxM14iB
         2QTA==
X-Gm-Message-State: AOAM532C1NAmzdJzG/oRLkrPNvgX+ePzySUt5glR1aRpm1q4vNcNHPF7
        wRS4MIt5IiaoTok+tdMlBQ2aSA==
X-Google-Smtp-Source: ABdhPJwKD0stjojj0JVqzk62Y5+rYQTTyLyP+wiunWy0fhaUgzh773Ul0MPHiF6T1xTfAVXlqMFVyg==
X-Received: by 2002:a17:907:7d9e:b0:6df:9fe8:856a with SMTP id oz30-20020a1709077d9e00b006df9fe8856amr17667048ejc.373.1649417085194;
        Fri, 08 Apr 2022 04:24:45 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id p14-20020a05640210ce00b00413211746d4sm10343381edu.51.2022.04.08.04.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 04:24:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 08 Apr 2022 13:24:43 +0200
Message-Id: <CJ4TK3GWP00Q.1SDG6H9Q4GP37@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <linux-kernel@vger.kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        <linux-arm-msm@vger.kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        "Andy Gross" <agross@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
        <phone-devel@vger.kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: qcom,pdc: Add SM6350 compatible
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Rob Herring" <robh@kernel.org>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
 <20211213082614.22651-4-luca.weiss@fairphone.com>
 <YbpLnWKRq5TRO+Uk@robh.at.kernel.org>
In-Reply-To: <YbpLnWKRq5TRO+Uk@robh.at.kernel.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi all,

On Wed Dec 15, 2021 at 9:10 PM CET, Rob Herring wrote:
> On Mon, 13 Dec 2021 09:26:04 +0100, Luca Weiss wrote:
> > Add devicetree compatible for pdc on SM6350 SoC.
> >=20
> > Also correct the compatibles for sm8250 and sm8350.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > I do have the .txt -> .yaml conversion ready for this but will send
> > as a separate patch.
> >=20
> >  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt    | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
>
> Acked-by: Rob Herring <robh@kernel.org>

It looks like this patch hasn't been applied yet. Could the responsible
maintainer please pick it up?

Regards
Luca
