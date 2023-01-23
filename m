Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F892C05027
	for <phone-devel@archiver.kernel.org>; Mon, 23 Jan 2023 12:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjAWMJR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjAWMJR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Jan 2023 07:09:17 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3AD2197D
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 04:09:15 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id a11so17937769lfg.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 04:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtdbPPpjc+lx28u1inpjC8tVRtBtdkFrZzr/s7CL3PY=;
        b=ACfNot6L0Pw218eURjk9SmTS0Scf9EwrubmhuEKdKaqCwd+wyh+hMwhY5d3PUNVhe8
         cnIS8wmytuoXYpHSqdMWlMkxhI3ZyH91bc/Q6i3M0yBSlgMDl3ScaZVGLE1f7gz5h11I
         1pnyYwwNOqrU5d71MpsYpLa2NzjZ18me6qmLQwrRrmJ2CFsWP4z2zEKfWZPMFDEcTFS2
         S+iE9aZ/AvIJuwa4Imm8d7P92wdtYp7ZLvFd/MTDfWzItdaYI0kjekOeqRA4vJ8EgtpR
         s+ONP7aVvM2hMqFeBt05vApK0JjerbUnEg7CENA3un4jYHrxJTlzz8Ot0TR391xBbRgw
         pAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtdbPPpjc+lx28u1inpjC8tVRtBtdkFrZzr/s7CL3PY=;
        b=lWEzR6Uz/yQvFbOFF+RIw/wDD5pOY2tptHm2IpaFSJoL1Q96S7s8/e1z0v9mVK1aA2
         I8YCqNxOfrEfAPQTb+sreyesih7Q7xIq9zPf9pY6cSAyA36TB6ZGC9HjBacqwdLIY70Q
         sqZGHdNizyOlq5XVPG7vI7t+qJdgZA03ViR2luw2qc2tN0ullvv9eKDyoCpyKZyANPJ0
         EPdhvqyiLMfoW8Thge0MKZxBao9eWuZ1b1rRuxmmTG+Oc7+CZxvdXIsubdK+ezRIiWFV
         NDoL24IocIFh/tBCFrCmVOPCvl1lBCOOYeWyK/Bz+SQJ+kVntwJaMJLwkeVlOA8ral8I
         clNw==
X-Gm-Message-State: AFqh2koRqmFwu/sjHy6Jyk7Z/lN1UR5IlzmjM5Wh5AOAW66+3ABcUvCp
        xVrF1An5qXGX/biEF3ImVMFOIQ==
X-Google-Smtp-Source: AMrXdXv5gtv2B9DndvEPlMU7gIlEJOv+lFyjdYn94QbF0uqfgW3SYBTF+M6BUu9PMB72ZX4xbu2v9g==
X-Received: by 2002:ac2:5622:0:b0:4cc:9736:3551 with SMTP id b2-20020ac25622000000b004cc97363551mr5538071lff.31.1674475754288;
        Mon, 23 Jan 2023 04:09:14 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j22-20020ac253b6000000b004cc8a07c6e0sm4755764lfh.120.2023.01.23.04.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 04:09:13 -0800 (PST)
Message-ID: <86012074-5080-4a90-9a46-f87f3fc1f548@linaro.org>
Date:   Mon, 23 Jan 2023 14:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] phy: qcom-qmp-combo: Add config for SM6350
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221130081430.67831-1-luca.weiss@fairphone.com>
 <20221130081430.67831-2-luca.weiss@fairphone.com>
 <Y6xP4YRAp68TfxFi@hovoldconsulting.com> <Y8BIX+js1ircJyb9@matsya>
 <cf968a25-02f7-d402-530b-eb379b707e54@linaro.org>
 <CPR2LS3SJQ3I.Z7UY505COG3@otso>
 <CAA8EJpoOMMALHz7ysft6KvQaYhGWPD+xZiUjOTrC8CA_y81n-w@mail.gmail.com>
 <CPX2VVT5EUDV.2LH6VI2586F02@otso> <Y85WqDrGXAXp7gS/@hovoldconsulting.com>
 <a18359f8-6495-dbea-2323-8ab73bbfc472@linaro.org>
 <Y854Iz7gG6/APILo@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y854Iz7gG6/APILo@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 23/01/2023 14:05, Johan Hovold wrote:
> On Mon, Jan 23, 2023 at 01:15:52PM +0200, Dmitry Baryshkov wrote:
>> On 23/01/2023 11:43, Johan Hovold wrote:
> 
>>> We'll convert the older platforms over to use the new binding scheme
>>> soon and then we'd need this anyway. And if it turns out later that this
>>> was all bogus, at least we only need to fix the driver (and not worry
>>> about dts backward compatibility as we had to with the old style
>>> bindings).
>>
>> As you mentioned this. Do you have plans to work on this conversion? If
>> not, I'll probably take a look during next development window.
> 
> Yes, I was planning on looking at this after Luca's series is merged. I
> have some higher prio stuff to get out the door these next couple of
> weeks first, though.

Ack, I'll sync with you then, let's see who has spare time for that.

-- 
With best wishes
Dmitry

