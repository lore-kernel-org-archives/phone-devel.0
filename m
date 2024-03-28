Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6E812EBD3
	for <phone-devel@vger.kernel.org>; Thu, 28 Mar 2024 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711638723; cv=none; b=Mh8jBCQR87JBWyNk20sr7oxj7Y7d/XdrSfmcpBUBn64n0qrRSLNtaqnxkbeVBm5nnvLDxPE+yV4s5suuec+Hur7ta3qMkjTnmgGHlC3FsF+9SJ3fiH8c7YH/8uBwL5FJ19ugiww3JaV+RWkjSeR4db2MdbRu8Sd9/l+7/Li2wBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711638723; c=relaxed/simple;
	bh=4Pw+pFI94Xaxlpp7zHktGYlCAl2z0xnGa/oih8dZYgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLQVag20SqdYTW6vGt2eFO7BCLj8A1dmFK8SpeM2yAqsvPQH7oJegN6APIbsptL9Yo+KrC/SZndahgKOf6hOAnO6ABxp6j6PUHdO30DLoUnwe35/+ITFSJxxcCo5QxQ8pXVyL3LaoDMjPoL10TosxNoCcP4J3H7i6LcBTIa8A+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K0Sgsalk; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K0Sgsalk"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso1149583276.1
        for <phone-devel@vger.kernel.org>; Thu, 28 Mar 2024 08:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711638720; x=1712243520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K1dRERqIwvawP6yvst+7RzsJv2Gfa3ZP4TWtYVKk144=;
        b=K0SgsalkI2tp6jrsOrtUEBk4vsiHwmRqWTO7fVoOG0lc/f2FOsoyJXSJwFt5N9LYWJ
         OgFKevD3POjo9Qt093Bc5CPHw/ZFi4XlY3fNG2c4dZg6dT2oq6cB2BbMH6PpQRYo7c/e
         JGRuzOzotJK3LxC03d9jC6DDAfRTRU4yH4ew/RruKqxDS4cey6V+0iifKP5kN/hTBtJe
         fzuDZ6MaF/vdn7JcWhNGLIv7dIObgpKM9iYnNjxjphP325BU2YTEwbXO4n6vMfX3YG9H
         2vht0iSadDy9gcZlJrtdc2SFOSs92G+RvSaaX04ZkS/io75llyh7ZZiHwYofgwQ0fnAB
         JJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638720; x=1712243520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1dRERqIwvawP6yvst+7RzsJv2Gfa3ZP4TWtYVKk144=;
        b=vIaCul/yzG6EMO2Ihzw5UeKNNKRhs4JqJdfngQdubeLtq22dP/0cRsvdIYi+x+uX+2
         ekbrE5D6CgEEdL+6wxD1sFDl9TdeZMELp21pFP8AxaUu+tqD2mCaN8xSx4BM8cGatvkG
         9EX9MenQ4W9RbCzTLwNdY9Ozqp0s4ND+qAdd5cazpAgZU9+oQPk+VYpnYRr/l4s6Gl4J
         8HKoqawkiQ5FFJumqJKhZakcQpmCf0XtxcA0KmSjRgdU1VR0U17VIw/jASRHYaLvkwqK
         FzRzSJbZ8Fb9JG5gNIyF8YydPJwu8RN5Z0bqP0xMkYJncDbTPu8Q7SB4gTV1amYEeFJm
         xmSg==
X-Forwarded-Encrypted: i=1; AJvYcCWVttvr+HASiQVpKovut8FzekWwOU3VpdtpiGtLt6bDl8AlxxDj8V7ArKThUz1ob+WBB/s43AP2oxGqDZr0gwuZPbncL4RAosJKi80=
X-Gm-Message-State: AOJu0YyxesVaWSNvre+ch6ay7BgBQ4A+383Q5JYP7//yfrpVgxRtmhKl
	mf/q9fO7rekexFuT8eSrasoUOdjk6YREG//6nvx872v9Zl3eaJnKJrnFJH5MnkZNiIvWgmY31K+
	Lx4bKmXW9/+uuJPX95w6fKSIYH6LnfAQrJnx6LA==
X-Google-Smtp-Source: AGHT+IGrkzP9Sxso9Vjo20YSLlSXYjup2Hg+RTtCFuuy76qY0UhZk+SCGzz1Uxer7GzjgHrcr7xJIaioiBDkEDXa2kE=
X-Received: by 2002:a25:db85:0:b0:dd1:7128:617b with SMTP id
 g127-20020a25db85000000b00dd17128617bmr3216871ybf.38.1711638719977; Thu, 28
 Mar 2024 08:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com> <20240328-sm6350-dp-v1-3-215ca2b81c35@fairphone.com>
In-Reply-To: <20240328-sm6350-dp-v1-3-215ca2b81c35@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:11:49 +0200
Message-ID: <CAA8EJpp1XEh1CR8898HnStWizcgByREGk-2ae_Yr2xTvcrEbag@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add DisplayPort controller
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 11:43, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Add the node for the DisplayPort controller found on the SM6350 SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
