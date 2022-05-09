Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB10C433F5
	for <phone-devel@archiver.kernel.org>; Mon,  9 May 2022 09:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiEIJQe (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 9 May 2022 05:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236367AbiEIImg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 9 May 2022 04:42:36 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E425E1611D0
        for <phone-devel@vger.kernel.org>; Mon,  9 May 2022 01:38:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id n10so25369898ejk.5
        for <phone-devel@vger.kernel.org>; Mon, 09 May 2022 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rntni4SQyiBF3kclcH/uwuYNMjc+0Gav6ahcVT8jLWA=;
        b=bk1/jNFbKZ6drKaeIveJ1CWelZ1cpTEL75vlQwdj0IW7KioIx5N2FF24J+6CabFZBY
         9NdXBECWmNbxBwTqEsM1kj8T3e9YtCVZgXvnEZb3hZQFdTBLszNu62WRo52m1w71bXR1
         vk3KLowS2Qo7EgsaCjkpnFpzkSQvQzSW1BdBhcBvCJICOKhOAPs5UFK7EX01pcQat99Z
         dyJgo7BYeFTdiqRdcfwC0/H4SpgNIg9gONcl/WW4TxzYaxqVuzHT+/ZrNkCiabCxqRJ8
         ncmwUOB7q4OexlrPbVI9z5H5BFXuzT02OwX8ptniWXjnyiwxT1ZcfTO/bB/feE8FIc/1
         pO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rntni4SQyiBF3kclcH/uwuYNMjc+0Gav6ahcVT8jLWA=;
        b=h1JHmyCyJ6+TfaIhmVShYpwpymdr0jf9hqaM26joBiMTPl6kZ6x6mdUPBNOBXrpmU6
         30QSdmoR7VxuYQEXqsChd5/u7vWVkycpf7Gh5fCntGpiGxNjjQmNTxdufhwBMsjdJylc
         SeDFglZF+A5dCSXTk/vvUUmir6QdwTOkzrpJP30lKKBX57OfAjpvLHwIJiu94iyOiS3G
         8YDSwJuJKim/BOl57bbcd9Si3opfhiBo5eMQtOmaGegmCYw5FrDH+j9uHakOXnKxQZ3o
         bNTc4uzQYABmSrIQTN+Mvki8vqykrxxlLQVNlxTgxnUpwBrfw0ikmVpE164Kt4uodjfm
         X0fQ==
X-Gm-Message-State: AOAM533sVDayurMWHK05JJJbuUipzjGkPVntHZzbYocG5MtB/VRWVh8h
        FA4LwYRYdanmLgsXjACEljPgug==
X-Google-Smtp-Source: ABdhPJwv83eNKe0k4LJHVdnwRwqZaK6uzaa5/2ImTxiD3IfkbrSYsnyFetysu+O+gxXXo2FrjJVEtQ==
X-Received: by 2002:a17:906:a05a:b0:6ef:a44d:2f46 with SMTP id bg26-20020a170906a05a00b006efa44d2f46mr13457193ejb.192.1652085519443;
        Mon, 09 May 2022 01:38:39 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p9-20020a170906140900b006f3ef214dcdsm4840869ejc.51.2022.05.09.01.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 01:38:38 -0700 (PDT)
Message-ID: <bef4922d-4a32-f184-44a1-8f5430190938@linaro.org>
Date:   Mon, 9 May 2022 10:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: convert to YAML
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220103074348.6039-1-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220103074348.6039-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 03/01/2022 08:43, Luca Weiss wrote:
> Convert the PDC interrupt controller bindings to YAML.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since v1:
> * Adjust description of second reg-name as suggested by Maulik Shah
> 
> @Rob Herring: Hope it's ok to keep your R-b given the above changes
> 
> This patch depends on the following patch, which fixed sm8250 & sm8350
> compatibles and adds sm6350.
> https://lore.kernel.org/linux-arm-msm/20211213082614.22651-4-luca.weiss@fairphone.com/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Luca,
I think this needs resending as dependency was merged. Alternatively,
maybe Bjorn could pick it up through QCom SoC?

Best regards,
Krzysztof
