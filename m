Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68724C19F2C
	for <phone-devel@archiver.kernel.org>; Thu, 28 Jul 2022 12:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237899AbiG1MRL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 28 Jul 2022 08:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237099AbiG1MRI (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 28 Jul 2022 08:17:08 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771E76B266
        for <phone-devel@vger.kernel.org>; Thu, 28 Jul 2022 05:17:06 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id h12so1757354ljg.7
        for <phone-devel@vger.kernel.org>; Thu, 28 Jul 2022 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SAWlWlo5GyVcE2aVGpSKqxbu1YUmv/l8IRZI6iKroOU=;
        b=BXCd3H2LIDg72mznLqVg5bCu0ydPWZ9vxSa+uouKxRIMrlEOyi6wiRbwpeI5l73R+O
         zlzDvu0U4f3TAGJvsEHQySn6MI7MaiGA6Qb8sLyjf1i9cSbqdQuhf6KOar0piZKkqhIw
         khEN2g/YMno9sKaTw/kbqVdlu20zUch89KBAAQNpMXN0kRs4ZspH8+Ngbw0EKao4z/Kh
         zAX/YTf2W0j9XVAMQn324gViKVkCrjnyIDndRZApF7blfneG+w5miK8qw5KFvcbOmWFi
         g+34B7gVdfQXWUMeVh3vfs23vDQOb7rhcgxrV+KI2FRmXNY4HS3QGPORkvgfFofZDGtu
         mJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SAWlWlo5GyVcE2aVGpSKqxbu1YUmv/l8IRZI6iKroOU=;
        b=b5hTM1uWH5q1Ys3nrQY/IXs1jJ24mOZkpLevtstMHzZ/+4aK+OAyKXpFocgiqHXpD6
         8wINRIJ7ru94usAjFNZawUpQ/D7t6Dy8DjixU4TP8EyPotJ4X7MDw9LLRkRfZt2F0EQA
         8cOOqdxvLtIXssDYiHBRNgjHOwFgvbh8Z6Jxze3+oCn/FBgzHxhTioTfOMugTXQr6k/P
         pi8pU0xdUqzZKcZUHREpGpO5OQu4UHS0vZ140mgVu5zL9COTosNPXsm2HGA14uH2IKXL
         Eea7+KILEcdCDIYbt55zxihc6E7oFDCse3B5MDEPuP7doSIdbQG3+YX6223Myeo/83bB
         Mlgw==
X-Gm-Message-State: AJIora+5uZDX91UNYpwiQnNK9ykSokjshN8sdbpG1bEmP6oF8ArqWwhH
        1rbyrnzSAdEy3SWkALh8jsLuXPhf26qrtg==
X-Google-Smtp-Source: AGRyM1vI0ZKeUCG/yKFDtqirw8GvQ0KhX68RAHnYDcvxAh8pmNNCY3ml26WPiz6AEjbmu75zhj5hyA==
X-Received: by 2002:a2e:a177:0:b0:25e:2d69:391b with SMTP id u23-20020a2ea177000000b0025e2d69391bmr699026ljl.60.1659010624826;
        Thu, 28 Jul 2022 05:17:04 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id r4-20020ac25c04000000b0048a9ec2ce46sm169134lfp.260.2022.07.28.05.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 05:17:04 -0700 (PDT)
Message-ID: <5467d0ad-0285-f2ba-5366-68b0c30caed0@linaro.org>
Date:   Thu, 28 Jul 2022 14:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Content-Language: en-US
To:     Molly Sophia <mollysophia379@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220728023555.8952-1-mollysophia379@gmail.com>
 <20220728023555.8952-2-mollysophia379@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220728023555.8952-2-mollysophia379@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 28/07/2022 04:35, Molly Sophia wrote:
> Add documentation for "novatek,nt35596s" panel.
> 
> Changes in v4:
> - Correct numeric order of the items.
> 
> Changes in v3:
> - Embed the documentation into existing one (novatek,nt36672a).

This does not go to commit msg, but to changelog after ---

With this fixed:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
