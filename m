Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AF613AA34
	for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220703; cv=none; b=VyDgCvLWK1sex9ucHxFHQgP3l4HFgrGazk0i+8VfMiF5y3tJYfwCBDlqcu4IWSD/iXxcEZ4f9AlEdmBBO2JzTK48I+cEqGt0T+qab+wbi8I+PdG8R/osA8LTEkSuBM+ZeBMWxVFvm+3xWABnqa+S3Fg401VwcNf4G/tohBHlChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220703; c=relaxed/simple;
	bh=DbrULba5JMpUHoRfF0b2ZW/wUZBr+NdaB81g1Az+ZwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQz0yGY6osSvXqgNMk1DQbMJgLYy74b2r7HozaXibl5Y2pySCPGQtjnP3+Q4URSeNQkJ7Rkh2Zp9g27jstUSFq8X+0Mq9a+dasAoe79ieBvIUq85j7AF8QFTPyUkx7EU6s5xGtBQKNOgj+Myq8R5joRzr81yhV43STWLWcNHlyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/LggRvS; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/LggRvS"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc226dca91aso6901730276.2
        for <phone-devel@vger.kernel.org>; Thu, 25 Jan 2024 14:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706220701; x=1706825501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xLMcToKhdmiwb+Vgm0ASzJXUITbFWiE3/ITy5z4WO+Y=;
        b=W/LggRvSCWuXdK9eWrjp3B7WDHlvdrpo8hU+xMznLtEIyxmcbJ2x5eqB2uyncxAHt5
         kIO+xZfYPWClzevogWGF8FY2OObj9b+T7WOvQdhtSyrSj5BmwvtBTB0U0yDwc7o7488S
         RO9VAHWs9KreOkYP7nnAZSe5ySVe1gValr97KdrUqZF+lXOhcg6hR0J7UD1WV5ovReO7
         xvlsg1oA8kHDSdTZPAhF44qGbpGe7CFQRxxWRfGhlB6zAXzp/XmkH6jkSX4WIl1IAkLm
         2ju2HbMAYK+u7+dr8NfeWXUnv63rUxo6Rq2AW7QeoXSKBLRfVzUJz5cPxgMFvEbRrJNM
         fF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706220701; x=1706825501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLMcToKhdmiwb+Vgm0ASzJXUITbFWiE3/ITy5z4WO+Y=;
        b=aLKe4wKvjKEJuuTwrM3YWdMWX1jk9d43/rX8QMslmbprl4HpNqyF9N1r+MfxOm+QOw
         IlwkBAYYPt+gw5tFDO/z6ytj7L5KzT8m8vEvBFq8V/slPI+nA5N30Xf6SQEbkPEm0ad9
         H7dTszVGjGQdx6EGX1TFiT2dixs684i4tn6nIq5Lh/AEEAeIJstCSgOM7YduTyLCJzXU
         bkkX8jiHcZlMbTxr2yRSHyL2C4SOgx96jnolYimz0fpawqaT9vKSO0RAxlAMiVB6kNqi
         MLzVh5o8LUpYwhta1HW+OdrwQRj6h5HtE+vYBkF73Whk659eyR9OSwydtIFV4M6wf0Qb
         yMGA==
X-Gm-Message-State: AOJu0YzdgdUJi2y2Thl3oKmtRg3SaYi1u4/ThZlD4cLDPAKYlvCzbfND
	gg4zky5RZuEAjKtJo8ivHP+fxL0FMvfviFSZ8he8EA10IR9LtWz96NwIpDCL0HSpxj3M0+gtbwT
	J3wUdBWI6JK5MJVuYwJTGNgucJSANwO+LhR3Jqsnv/7cZQ8gUPj0=
X-Google-Smtp-Source: AGHT+IGyhYkUs57iPAfgqwjJQmmq3Qlba1EBKrI7ojK1xvRb2h7JC3m/aWADVmXJGmcqgLz60U06quUiTM0G9gFNWJw=
X-Received: by 2002:a25:2e07:0:b0:dbd:5be1:1768 with SMTP id
 u7-20020a252e07000000b00dbd5be11768mr471772ybu.73.1706220701308; Thu, 25 Jan
 2024 14:11:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-msm8953-mdss-reset-v2-0-fd7824559426@z3ntu.xyz> <20240125-msm8953-mdss-reset-v2-3-fd7824559426@z3ntu.xyz>
In-Reply-To: <20240125-msm8953-mdss-reset-v2-3-fd7824559426@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 00:11:30 +0200
Message-ID: <CAA8EJpoVxyX-cVggL2RJvM1eG+XzF_kkgAsKdS8ybv7u_MAyXA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8953: add reset for display subsystem
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Lypak <vladimir.lypak@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 23:36, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>
> With this reset we can avoid situations like IRQ storms from DSI host
> before it even started probing (because boot-loader left DSI IRQs on).
>
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
