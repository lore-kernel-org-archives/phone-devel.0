Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DFFC76195
	for <phone-devel@archiver.kernel.org>; Mon, 27 Mar 2023 14:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjC0Ogf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 27 Mar 2023 10:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbjC0Oge (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 27 Mar 2023 10:36:34 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54712D6A
        for <phone-devel@vger.kernel.org>; Mon, 27 Mar 2023 07:36:30 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id i5so37311960eda.0
        for <phone-devel@vger.kernel.org>; Mon, 27 Mar 2023 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679927789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uu6fkWav3ppxq5pM9npOEzd2xjd4ddBcnc58P+RleNg=;
        b=dixFlR7vwj58oeZiyskfKaq+idVN/lfcDfveh6RzsNqwaBbW6aRWgM1qAhigliKZit
         EamWShZ4+Qs5K9f9nvr0FGBc9gOxmHg00yR2Fb3vIaKfSAXErLTaPBUNar3jYWWD4XIE
         n2pRG51YIU9V+7RDMdd2iWtK1WqOrok8x6nWcpCfqSn/896hZZ1G5Eo6Jb14+td1NZwk
         JAntbz4MVUPW7PGJ46HYJdxjeW2HO5XHAicamRTXDR9gBHpUXl2+DiggkMNwYTrSh2KI
         RGqLcUOL713nAcRWmMulyjVO/8K6dDKUr5gD/U3ayQ2BROL1BN9t1+9YrzUBdLgp8PQD
         +J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679927789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uu6fkWav3ppxq5pM9npOEzd2xjd4ddBcnc58P+RleNg=;
        b=PcmC4AnNYgElRdEnsNVCKyfZ9eT0MCFyHBhqdqsyiAKztDzhJ7A3+wP/1wEEnfi6xu
         Z7f/kgrSccj7sQJh0Xlmuq9YqPXuv1VldCgvnV84EoHA1aCC8ISn7Tlg7ahhNWWm8FrM
         Gep3NjcA+uQWtndnQIYQGeTFaOvPMp21E6Lxdzg8763KG1w/bTEp1c0Ds9RQELIjklRc
         BuXUWIKfM0pMUrwdFrVWneP3gFLjHAAHKG8fztFXFRGAUQmMMWe/BUJl8UCMBQRdgKDT
         VpG+3zmIKwbwO9tw9NHR/EAaZT1bsmcLtY5/IQeJTBBljjLFgtglRsXGdRmoKPb/QfZ9
         HBhA==
X-Gm-Message-State: AAQBX9dSxR4nZOVrnGB7NVLrqky7T0KU5ULHK7g+wlmXObtqOcXRPhPB
        xOqqPcSW4BujWqqwRKOJYXFl/Q==
X-Google-Smtp-Source: AKy350bg6TxFCCNmhZLnsqu23dSEIWha0A+ezGd8KtPB0/kJ0xc8L9JLyb1v5Kl3kmpV18AiNMr34Q==
X-Received: by 2002:a17:907:3f88:b0:909:4a93:d9d2 with SMTP id hr8-20020a1709073f8800b009094a93d9d2mr15929529ejc.2.1679927789302;
        Mon, 27 Mar 2023 07:36:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:581e:789c:7616:5ee? ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id ha8-20020a170906a88800b0093a6c591743sm8733914ejb.69.2023.03.27.07.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:36:28 -0700 (PDT)
Message-ID: <c540f72b-3fc9-f5c0-0cf4-20903e5f4625@linaro.org>
Date:   Mon, 27 Mar 2023 16:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: misc: qcom,fastrpc: add
 qcom,assign-all-memory property
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230325134410.21092-1-me@dylanvanassche.be>
 <20230325134410.21092-2-me@dylanvanassche.be>
 <883c3c48-c6e5-556d-431f-e92592b9106a@linaro.org>
 <b75b92bf64b55ba0ace0fbff65955c838a294dec.camel@dylanvanassche.be>
 <44904ffc-83d4-1137-3479-737a81b31d16@linaro.org>
 <1f3fb4bd5387c8d69a6eb068fb773b9273081c13.camel@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1f3fb4bd5387c8d69a6eb068fb773b9273081c13.camel@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/03/2023 16:26, Dylan Van Assche wrote:
>> Bindings are not for driver behavior.
>>
>>> Downstream does guard
>>> this with a property 'restrict-access' as well, see [1] for a
>>> random
>>> SDM845 downstream kernel. On SDM845, this property is not present,
>>> thus
>>> the IF block runs. On SDM670, this property is present, then the IF
>>> block is skipped. That's why I opt for this property to have this
>>> behaviour conditionally. I'm not sure how to explain it better
>>> though.
>>
>> Still you described driver... Please come with something more
>> hardware
>> related.
> 
> So just updating the description is enough then?
> 
> As this is all reverse engineered, I have no access to the
> documentation of FastRPC, so best effort:
> 
> """
> Mark allocated memory region accessible to remote processor.
> This memory region is used by remote processor to communicate
> when no dedicated Fastrpc context bank hardware is available 
> for remote processor.

This description does not explain here anything. The memory region is
already accessible without this property.

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.

Remember that any arguments to downstream are not really good arguments.
Their design choices and bindings are usually totally not acceptable.
They simply embed whatever driver needs in DT - policies, system
configuration, driver behavior...

Also, Dmitry made here good point.



Best regards,
Krzysztof

