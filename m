Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B22C77B7E
	for <phone-devel@archiver.kernel.org>; Tue,  2 May 2023 11:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbjEBLR2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 2 May 2023 07:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233143AbjEBLR1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 2 May 2023 07:17:27 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23932E0
        for <phone-devel@vger.kernel.org>; Tue,  2 May 2023 04:17:23 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f1728c2a57so36316775e9.0
        for <phone-devel@vger.kernel.org>; Tue, 02 May 2023 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683026241; x=1685618241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hC5rYIWvK/tkRAoPAEF5edYxUmmDzm+5+7yR1xwhyX0=;
        b=dxhKeusNbXgpsiW1CpqtUWcJK9plsg0Ezqx8fKwR0zapkU8N3hAGXDFmSDhCiB6w46
         XVdt76X/wBAfL5WxSmINEmhZ3rxgkeXQdM+wozMGQQQBDpYr7R9h6cj+zRwJH/5cBbWR
         cRo/jwT083+CMmIMSImONFUnlHgocMCxXlNgI45kpy/JicSeJPaDEhV97la20RnohU5f
         Xt5hCpW4cF9//AvzGDbxn+p3xgGFMEYbGxMk8QvpBflWwvQn7BI2Arxol3s5E2WleiZ9
         qlLwtugL5TMWQ59Xj4RxXRWRaXxFj1RM6JOFjfXBE/cEuW8F9chZ1nuBm9YYFFHqIP5u
         EAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026241; x=1685618241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC5rYIWvK/tkRAoPAEF5edYxUmmDzm+5+7yR1xwhyX0=;
        b=K9YvKmhUZUImiieawNoEpCwj9IxN9eJy8+ex7JwpefW01cCkwLNn545qM8xY0TJ45k
         LLtPBq2vhoLQ5wCDEJZk8h7kNttgN2wThZ7YMNVr67TzCK6TslL/8cL/ciU5hFYOBwjN
         1EA2h4L6Wsfwo/Xl4SgMFESv46K8G3H7iis2FUfEHpYZ9hTdDTtCKkFsbgMWZ4TtF81+
         /BSyviEHS8l/TJf70C/Rh8C7EzWwzWepgEItCJxGJYmgFzzGiGyrNKlOY27Vk+UsE/X1
         9cnmE1Wp5yeKLI8QfVpTEk83t8JKNq27T/kG7Ra/rgL9Tq9mnsypSbC5WgaKC4njEbnE
         RCuw==
X-Gm-Message-State: AC+VfDxEqUeHeqVQAdXWGthVeKlI/19KMQ/ZAmqH1Cltt46GD4pS68Dt
        BNvXAHV34Hxqx8dpn0X23Rw+Jw==
X-Google-Smtp-Source: ACHHUZ5zpyqpXr+mFRT0QdK4GBZ6IFbr+l3lnDvYTS2KPabZ8s1ZjpQNTuYHyGo+UuIIUaf8/iI6jw==
X-Received: by 2002:a1c:f019:0:b0:3f0:49b5:f0ce with SMTP id a25-20020a1cf019000000b003f049b5f0cemr11338031wmb.12.1683026241502;
        Tue, 02 May 2023 04:17:21 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c365500b003f182a10106sm35223317wmq.8.2023.05.02.04.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 04:17:21 -0700 (PDT)
Date:   Tue, 2 May 2023 12:17:18 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: backlight: ktz8866: Add reg property
 and update example
Message-ID: <20230502111718.GB15678@aspen.lan>
References: <20230428160246.16982-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428160246.16982-1-lujianhua000@gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, Apr 29, 2023 at 12:02:46AM +0800, Jianhua Lu wrote:
> The kinetic,ktz8866 is a I2C driver, so add the missing reg property.
> And update example to make it clear.
>
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
