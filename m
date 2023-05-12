Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9EBC77B7F
	for <phone-devel@archiver.kernel.org>; Fri, 12 May 2023 14:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241294AbjELOaS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 May 2023 10:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241564AbjELOaQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 May 2023 10:30:16 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB5514371
        for <phone-devel@vger.kernel.org>; Fri, 12 May 2023 07:30:12 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso17730461a12.0
        for <phone-devel@vger.kernel.org>; Fri, 12 May 2023 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1683901810; x=1686493810;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0OGsKjyATKDb9jYmWbTNqZ4sLTa+V+9kzUcaHu+Bg4=;
        b=NjrV3H/c9DiHGBEjjvqb8Ko94Brk1Dtf/oCUqkm+fROH8lHlSrr1UArdUvMSuEBrTZ
         LG/tVEizSEHlJUQ6SllSMvjU3iTr8RuxOD5O+u1z9ny+O9O+qn5+rpUf8zaxad3xcWxy
         JQN0iIZdGmRwGWUqSgV4B5rNFQVCc5GNL+f0uxFlOSL46MjDUc6RjinVG3auLy59Lnse
         w+2tlm0HEpP81jVq5AOcpkkFZUZRCPRUR1AnN8yEihy7UhOoYS4+Iv+34hKuTifuEGJg
         W2HF0KkXX8wGXC+UhlM6vOA8Bqs+Tku0ObCpDvdnf8n6wG3OfKQH8PW0B1e6Ic2kqOJo
         bkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683901810; x=1686493810;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T0OGsKjyATKDb9jYmWbTNqZ4sLTa+V+9kzUcaHu+Bg4=;
        b=S0hA9sH2JTbft/xtmmAV2QdlDGRMJ9q8TCjnVsfl0v8YzEqQdyAz4M9JFoUkjr1cuC
         vzb0xb6o1xRdLjJo1rSBVB6ntdXxKu3b5YGSZKcqUnF2r3bbaH9JKlj++i0pYY0ckKEN
         QeZkDwBlBkvVjuOoYUo+QXp3bPI53yOAdYXQcYL0n3EJsWBfz3HPOdCxRZixjp6dkuYd
         beIKN6MGy0mBjV5mP9+Ky2FrgMO7ZmUTTXUKLjCLZw6GmFzGWZY8+5s/XrF0h0GS+0J1
         cFGATe8CfgBu3RLFE7fgbncPfzxqIrgfQp7RkFbjY+DVwe/VAkpZuxT2qlRFjAoqjcWr
         XSXw==
X-Gm-Message-State: AC+VfDx8MNQSB+vWjg9luXu9Cyrly9GiqwJ9O6oDQ8bZcaR57JKW+GG9
        c2MOkYgRRZ8TfUxANbtO+IwCQQ==
X-Google-Smtp-Source: ACHHUZ7wfROlWoHHVhBbZ9cSWpXy+k/in7usHaTGZqbXMeEoLhu2Kl4Yjqa2+xah0carSqkZXnUH/g==
X-Received: by 2002:a17:907:a41e:b0:965:e556:8f6d with SMTP id sg30-20020a170907a41e00b00965e5568f6dmr23781673ejc.63.1683901810620;
        Fri, 12 May 2023 07:30:10 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id kn3-20020a1709079b0300b0096a27dbb5b2sm3518504ejc.209.2023.05.12.07.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 07:30:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 12 May 2023 16:30:08 +0200
Message-Id: <CSKDDFPXC6FD.1TAU3XXOSGA0K@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric Dumazet" <edumazet@google.com>,
        "Jakub Kicinski" <kuba@kernel.org>,
        "Paolo Abeni" <pabeni@redhat.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Balakrishna Godavarthi" <bgodavar@codeaurora.org>,
        "Rocky Liao" <rjliao@codeaurora.org>,
        "Marcel Holtmann" <marcel@holtmann.org>,
        "Johan Hedberg" <johan.hedberg@gmail.com>,
        "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH RFC 3/4] arm64: dts: qcom: sm6350: add uart1 node
X-Mailer: aerc 0.15.1
References: <20230421-fp4-bluetooth-v1-0-0430e3a7e0a2@fairphone.com>
 <20230421-fp4-bluetooth-v1-3-0430e3a7e0a2@fairphone.com>
 <8f312ded-8456-eced-85cc-0ae32a0c8bba@linaro.org>
In-Reply-To: <8f312ded-8456-eced-85cc-0ae32a0c8bba@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun Apr 23, 2023 at 12:51 PM CEST, Krzysztof Kozlowski wrote:
> On 21/04/2023 16:11, Luca Weiss wrote:
> > Add the node describing uart1 incl. opp table and pinctrl.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm6350.dtsi | 63 ++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 63 insertions(+)
>
> Please do not send DTS patches for net-next. DTS must go via Qualcomm
> SoC. Split the series and mention where is the bindings change in DTS
> patchset.

Sorry, just saw now after already sending v2.

Is this a special rule for linux-bluetooth@ / netdev@? Isn't it easier
to keep it together so the status of series can be assessed easier? I've
always submitted patches by topic, like input patches + dts patches and
it was never mentioned.

Regards
Luca

>
>
> Best regards,
> Krzysztof

