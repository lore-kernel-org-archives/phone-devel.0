Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B524B5C1
	for <phone-devel@vger.kernel.org>; Sun, 18 Feb 2024 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708294267; cv=none; b=nuX/nGy38DK4L09rbzuF8qQ4rNAJg5JqlKH7edGQXNhCiNRAvDOd76z4MKBsohQ/Ix7DjlaVEvr9QyQxNiqgc89B98wEMnzHG4w1WhqWu6YPUyht8y0zYVOJrAt3wSxLxoD9/Tj9EVUiMkgMnos9yB9MBtTviZJ9AzTvZF0QoYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708294267; c=relaxed/simple;
	bh=tvvDncg1WI0//tRyUMP3lqwcPgPfZh9W8WMZ0iFU1aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUQAcVL8fGkA2Evxga4fTKFUDe8lEhMi5tppwWA4SRRIkCzwQzkPQAb7TprM2ohtBVWv5lEjcWzuq5H6xnYstyij5HU3637PJtmtJJr6Vv4FYOU74VomwRE27SYV8hq31wOOXFwI9lvNHd2kVKu7jt/l8CWeGVQPzfRXbexquzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ArnORYKH; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ArnORYKH"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607bfa4c913so34588137b3.3
        for <phone-devel@vger.kernel.org>; Sun, 18 Feb 2024 14:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708294264; x=1708899064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+AD8w89s+gvj0mKYSTbVikH3rVbe83iTAnvtx9TnsS0=;
        b=ArnORYKHXrzaDsxMqqx5jIlOb8lvmgFQ8BKGJdwK30BLj/bJ+ic3X7Lf5mj7SjN2oa
         bAr8nRDPLTdCCL/GJLHMLSZ0XbYm57Tl8hzGkrXmlJjLWdy1uTpQ97DQ5kzVLBDu4K4Y
         /coNYyFv2/d4cRtP4XtcCOSOsNY5HIbzsnGcnlnV/hSnw2YEMKTyV7AjyeLi0zr7WApa
         EwYd8jbAT9pdP8/axTwlJJu/c2oD5ePgG62AmELCmsVsF0ZaltSfDltXbhQS2bqqyqa6
         TLqrrvsHoDAadG7Bsopw245mOtQ4tuDEoYPDIggAscpRNjZVgHI4SIqj0u2qncC9lFdX
         gtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708294264; x=1708899064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AD8w89s+gvj0mKYSTbVikH3rVbe83iTAnvtx9TnsS0=;
        b=Iw9Y5TFC/McDSmzJMD/LSobeAs7iydIzuMMHTqZj/cauSM+hUZtTCfx2BRv16+7NkU
         5cykFZ6aZ6V7mXjAtDVjOSNqhQANxVNLNmiC6lcKxP2Y97OT26rnp32oxXmE2WF4ggsu
         SPpVSwFpAk4fQOoDrpLmmVSlfB62x/AG+XhhFt1TMqN4cWM+ogSwU6t3N+iKY5JsQDS8
         TBAH/DshC27GhVLLRefcRR4JchwAdHK18/o9fFfcXVrGvElixc9kiBIypJ4cfuECcRhH
         I2EEZYSV/TTvpEiPZjPSfO7wEvuts72JtVFzidScIMP6lBqQhCspYJuiucUH34C9JF9d
         f2MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd7ln75LmF4PUKgXXLXkIgAgshCaRimsuJhauYX+1R5VniAUeIofl1NaFp1JDXK9Cxd12SSvPRcOcwFnn/CgqjGYfbAkcWccy0ZAQ=
X-Gm-Message-State: AOJu0Yz+IBAl9rx1ES6shEIsncq1CPmrwYMrJykezTbBJobRwH2UtxUO
	JmSAPvCbSD8wI91PVIDPB/qKO/hUZtg22pGrN9F/7v58mLdAuyN8br3xv7PIn+XRj0aUz1IihT/
	yuLUNZ3GGl6RUCiMrnxnnxKSyLMeMpYgBaatYphwxQLaqx6TF
X-Google-Smtp-Source: AGHT+IEgg0E5u1X5ebuYXnJ++SELErkiGN+TuPyNky9IKq31ECZO7bB1+ZtCKqmUvcixZwfyK121qgFIcMfvjQlbF9Y=
X-Received: by 2002:a05:690c:fd0:b0:608:d1d:d8ce with SMTP id
 dg16-20020a05690c0fd000b006080d1dd8cemr4935951ywb.12.1708294264190; Sun, 18
 Feb 2024 14:11:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240218-hfpll-yaml-v2-0-31543e0d6261@z3ntu.xyz> <20240218-hfpll-yaml-v2-3-31543e0d6261@z3ntu.xyz>
In-Reply-To: <20240218-hfpll-yaml-v2-3-31543e0d6261@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 00:10:53 +0200
Message-ID: <CAA8EJppEyibLz3z4UQbTdR08332w0OoegbOWTz0QnD9rcRb2DA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs404: Use qcs404-hfpll
 compatible for hfpll
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Feb 2024 at 22:58, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Follow the updated bindings and use a QCS404-specific compatible for the
> HFPLL on this SoC.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Please note that this patch should only land after the patch for the
> clock driver.
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
