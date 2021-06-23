Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A443C48BC2
	for <phone-devel@archiver.kernel.org>; Wed, 23 Jun 2021 03:33:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C09C611C1
	for <phone-devel@archiver.kernel.org>; Wed, 23 Jun 2021 03:33:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhFWDfZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 22 Jun 2021 23:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhFWDfY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 22 Jun 2021 23:35:24 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE4DC061574
        for <phone-devel@vger.kernel.org>; Tue, 22 Jun 2021 20:33:06 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id v22-20020a0568301416b029044e2d8e855eso572603otp.8
        for <phone-devel@vger.kernel.org>; Tue, 22 Jun 2021 20:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LUc/CMzwyAMmIfBZUm64TD1gM42DNa6BTHTCy82+BB4=;
        b=tFPFCIwzK9k5OT6bjBwGn4U/IGsIEyokHOPXQHFUffgdiAMlMbaueq/64zZKYFavWk
         oU1UGiE00REnZdfrxutQma2JlV+eAvVtvSFlXGjuk0ZFhp47NVSyzUM+oDj3yqEvUuN+
         bSjN1FbCS8t6dqqhtkiXdgd0zJ+0J5Gszi7i3mnzhoAAvvN63ArKuMIKWqZfuOFyAYoe
         YJqxQg1HSJXwwJ/lx9BE6HfJG5AoEo5FUVQvv101Jaxe97BqlfUWO7TrGzEJbicYPxOG
         HrC1iAxgAmc9wWwGQwr7nWHTkpHxJIm8hXNaKKc72fQuD8efAxIb9l9KFh+TgWRhx15P
         jX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LUc/CMzwyAMmIfBZUm64TD1gM42DNa6BTHTCy82+BB4=;
        b=hwO775fVWbE8ksogCU3eq/3HhjuDa+412SdJSmvKr0107G4Ku3VzQevHRGyuLKl+UG
         3FikCdfx1pSdtagkkav/9SCDXnNKCxtbpK1Qo49pgAcUWcFJBfZ2V3ZozsaVc74bdZd0
         kn6mRXKm/IUHBkPicZxq3akFYEKv/3GceNPW29D2whNJxoI5p93J3V4lDAaAoP1G5Bkb
         JeUruISMvRWU9YtEH3Rllb34nJmstWJv8C4CEFjsEyOuhS06M0MeWJsbT0xaCSXDmhV8
         V1pJ9dHvv6OKvdfRvS4ZxzfOb1+cc8EEKme1s3FEIJTM10HtIJaNLFH7IQ6I6hZfgHPd
         3bGw==
X-Gm-Message-State: AOAM531P5p6vglOmvz2KOW83NrpEzQbGXORAZ1LSOh/Qiytcwo/JM8D1
        EWmyHTroN6v05YrPsNemlWpesg==
X-Google-Smtp-Source: ABdhPJx1m0AwnV2HEPSrpLkiEUal21OY6y3ubUm4VHFMNPSoK67PWwBu8/tbipA+psRLFC/HzCaIuw==
X-Received: by 2002:a05:6830:270b:: with SMTP id j11mr5807089otu.161.1624419186186;
        Tue, 22 Jun 2021 20:33:06 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b198sm4735924oii.19.2021.06.22.20.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 20:33:05 -0700 (PDT)
Date:   Tue, 22 Jun 2021 22:33:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 1/3] dt-bindings: usb: qcom,dwc3: Add bindings for
 sm6115/4250
Message-ID: <YNKrb4/X/1EIgnsI@yoga>
References: <20210622203240.559979-1-iskren.chernev@gmail.com>
 <20210622203240.559979-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622203240.559979-2-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue 22 Jun 15:32 CDT 2021, Iskren Chernev wrote:

> Add the compatible string for SM6115/4250 SoC from Qualcomm.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 413299b5fe2b..4e6451789806 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -19,6 +19,8 @@ properties:
>            - qcom,sc7280-dwc3
>            - qcom,sdm845-dwc3
>            - qcom,sdx55-dwc3
> +          - qcom,sm4250-dwc3
> +          - qcom,sm6115-dwc3
>            - qcom,sm8150-dwc3
>            - qcom,sm8250-dwc3
>            - qcom,sm8350-dwc3
> -- 
> 2.31.1
> 
