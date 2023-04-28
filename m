Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98A9C77B61
	for <phone-devel@archiver.kernel.org>; Fri, 28 Apr 2023 16:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjD1QMV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 28 Apr 2023 12:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjD1QMU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 28 Apr 2023 12:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB4B2122
        for <phone-devel@vger.kernel.org>; Fri, 28 Apr 2023 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682698295;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xvahxQLiQFCmxj/da0CErLJVS9PB2G5zFVCmECHMB00=;
        b=hvLxnunLzGYRkF0Lsld1RP0oQac6lqznItPR2EN8BtmBOsMWPp3mg3RCtF1YECk8potdnD
        vEiOusNgatX1myiO7b7OWewQmtLqqjXo0LvtpqPPcRSvuKnzTfcmzXjuMnx9jSltaLlDJB
        50oGhOe8QgA6MWw9qi4gUNU4jwj7a20=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-2C-cgSexNYSLwjwO78eC4Q-1; Fri, 28 Apr 2023 12:11:32 -0400
X-MC-Unique: 2C-cgSexNYSLwjwO78eC4Q-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-559c416b024so517077b3.1
        for <phone-devel@vger.kernel.org>; Fri, 28 Apr 2023 09:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682698290; x=1685290290;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvahxQLiQFCmxj/da0CErLJVS9PB2G5zFVCmECHMB00=;
        b=AA/KpGTP07cGZN2DPUNnzXW1R1PrDYJXqqcTDPvGDogACzncLM0zW83/UwJ27u4BQz
         TXyDHGjFc8TdaiGUHmWz5Duc9kV4eTysjdVr6xTT46Lir1dOTkahY6J38GmZV7P1CMtl
         eLtVY1HG4NUgYLuRNfypVnyq+ZGb8NoAtbvJ0OeZXEuWnUUobKBqbBQ7nRaitRSgceo2
         V8V2wMzeo87TjYk2uwUnkLRqpuXtQIdzcE/aR9dHZdbO+GLa465Ti+g57cZDIfwf93wn
         NaU+1RAkoUXH4I8XmYG59kwfYL7gYh4ek7dTTb9oyKsCcOgJya1hkSQdzoO6sXxNaaTB
         xL/A==
X-Gm-Message-State: AC+VfDw4jPM7ybe1pRFgejJPY/sU/fP3Q4YKHRii0XAOUmXuVvnABAqb
        9oA4ZQZmwOyVn4kd/HDRwKb3QhIA+5y1sl/DsRSfR3TuRWMLblskOd5vFBldbxlQcTMaKMRnDVo
        kP0nAiupS0PbzoUsuONiEEq8=
X-Received: by 2002:a0d:e781:0:b0:54f:7971:4f87 with SMTP id q123-20020a0de781000000b0054f79714f87mr4293699ywe.36.1682698290454;
        Fri, 28 Apr 2023 09:11:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6eQOValmuJ/zOGLy7XBJvtcPQGnD4pUgv35/t3W92dQB8jJAbCq53fx3gGDoRQ4+mPyAlOcw==
X-Received: by 2002:a0d:e781:0:b0:54f:7971:4f87 with SMTP id q123-20020a0de781000000b0054f79714f87mr4293686ywe.36.1682698290218;
        Fri, 28 Apr 2023 09:11:30 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id d190-20020a0df4c7000000b0054fcbf35b94sm5497442ywf.87.2023.04.28.09.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 09:11:29 -0700 (PDT)
Date:   Fri, 28 Apr 2023 12:11:27 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: pwm-vibra - add support for enable GPIO
Message-ID: <ZEvwL69i2Wzdoagt@x1>
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-3-e87eeb94da51@z3ntu.xyz>
 <ZEsFV6F4CEh2/av8@x1>
 <8250064.NyiUUSuA9g@z3ntu.xyz>
MIME-Version: 1.0
In-Reply-To: <8250064.NyiUUSuA9g@z3ntu.xyz>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Apr 28, 2023 at 06:06:20PM +0200, Luca Weiss wrote:
> On Freitag, 28. April 2023 01:29:27 CEST Brian Masney wrote:
> > Take a look at dev_err_probe() to remove the -EPROBE_DEFER check.
> 
> The input subsystem doesn't like dev_err_probe for some reason, you should 
> quickly find examples of that being rejected on the mailing list (or see   
> "git grep dev_err_probe drivers/input/")

OK, that's fine then. Feel free to include my Reviewed-by.

Brian

