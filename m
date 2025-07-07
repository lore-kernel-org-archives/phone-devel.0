Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C9298270
	for <phone-devel@vger.kernel.org>; Mon,  7 Jul 2025 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894613; cv=none; b=RH/G5hId5RgrfBAvUguILh8T8C36ClTHIi9jRl2yeGlCA794e6Cm9ZYeI7VhQ06A/X06SDzmRzkY2iuJp4l50F48I28L/HSHoJXeqUSIZBN1bpOeK6uW1S51Elle0xdx0lp6yasoqUyWoqt9YjvgDnT1vVD6wY2IW5yDdagetSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894613; c=relaxed/simple;
	bh=9XfDpieyU8b2140bQho6t1DhMkVdpW1ldUV4ZihuTTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WP1gLF7Som3IKjqKNZn2wsnSFL0LGh2nTMZ5uO2Q59N/yJlHj7UMMcbuJMkz5ibqyvIBZnQSqdRdhIfef1CDUL/7vdq58BWkczIQ4p4cyC655Iq/ecDL4/z25mDSx5YLPo7gHc6fQ4XRkhVKsHufdY39SQ/akizIo8DbqEoYc04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gevcj9V9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gevcj9V9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so2922609f8f.2
        for <phone-devel@vger.kernel.org>; Mon, 07 Jul 2025 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751894610; x=1752499410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1JkCspwJaFqJzSejsi2dTXNLAQ9s3FaAdM20lcOhVo=;
        b=Gevcj9V9EMw7bXaPKvYUKkie88kBByVNXW+lKU1EXPEP7LZnEfQUV3cn8x58bQVVwi
         DgvPnSK4Ricdtz+otQKqZyLyJ5TkD/C1qTC3MpneMBtyg2nhIg07TkqqxsG8eOLi9h/D
         nTQf2/HI/huOU+tN1ZB3FXviCoSl//+xlUS+96oCVHelxXpJE76qCWXJP7zxmA1Mzp2f
         dPjFXQJAWLFBcoWMt0XFh3iXIC+jYPUmceClcCnKCf79zK6AL36Sb8fUFUVQowvTuKu1
         akNZ5I/q+bfK3Vl+ju0teTttgLIrwM5838oQPUPhCAIxx8Y8ej81BimX9aQPl8nS8fnc
         Cf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894610; x=1752499410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1JkCspwJaFqJzSejsi2dTXNLAQ9s3FaAdM20lcOhVo=;
        b=Hcxwus2osg2lpgwqPLHnAV6uWEHnPwXMFiQHsv5xXPjBve3hZzaRmIN7D4FSXXuPq9
         xhYTrV4ax1m0bFUqQC6pUvW2Lh+iTSucd+tiKiiPXxNucYbC1jMPwKlaatqlA+G60Ehk
         e/ZB2SuAeSbguLuef+qTIX+q05ZacvVSuJxIFgUPzeLIo0qsDTMFVDExFv2nz+OwjG5v
         YfyVUrP0Lyi9+pazHhDsdRT75Tr4BhdrX03i0CgvCZYREGOqp8mqY7Oik2NhNsEvIVwL
         nPOfKJzRThGjtzLvyMnm5RM55aY2zf5Kxqb2YfEZnHiT8muLG6a/XQosYI7yJnBfmEmz
         YbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZI370l1xDNc3pxgzX/ynA43QIqnETjq5dk8Zu7CEAzA8JaFrT56o1IpfJt0oW3H/lPcjyW2ViKlQV9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5bQKZ6f8gcQVkRI5d7cIM2yoqJP/cphlAH8n4iKepgdXmsNZ
	jid55ixCmioa4WMfhuoS3Yc2+BMSR9+3B0pjDbSN5SnV8zzvp4FmNyLBV6xLlD1yLbw=
X-Gm-Gg: ASbGncvolUb2ZLbEsu2HK1HDe8f7agAECv85zC+WpISH/gr2XRPcVzwUbYnnMBznzk0
	iyXo7a0Dz0vIy4xOuE8FMIBRKVLFFV3cqMttcFc6wrPW5c0/rj97cHC1LIDaaQJ21V6mS8ayLIo
	sSVZ8nxnTro53V4sCVS0ceTadTkVbNJU8kcsESzy1jtbG0Ppy0MlFf464S23HSjcfBmXSYR7ePA
	oQjFCanTUp5yW4c/cXLpJslurF2cUQZmgB5jziCIZL0u75DdA/HwY8V+4ntiFgrKofdO52Ej21V
	mRpaj9H+o0XKSPXCYD4gqDD8Qt13g/vahFSiU2vRoCrw/V/TBto33e97wG0mf8rUYTM/8kIK9RR
	xgAA0XiDTWakxxYJ8Nt65wW5TdzrnBiY=
X-Google-Smtp-Source: AGHT+IHqvfoZlxqkZhFZeUbrhKra+ACvfYiFm+JNhrK5L5id15gKmlIVnrRthZyMexYFNceXyA6Kmg==
X-Received: by 2002:a5d:59c4:0:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3b4970294afmr9707717f8f.36.1751894610045;
        Mon, 07 Jul 2025 06:23:30 -0700 (PDT)
Received: from [192.168.1.159] (p4fc3d4fa.dip0.t-ipconnect.de. [79.195.212.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9be0bacsm138744515e9.32.2025.07.07.06.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 06:23:29 -0700 (PDT)
Message-ID: <06760125-4800-4068-8936-dddf27c28d17@linaro.org>
Date: Mon, 7 Jul 2025 15:23:28 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add Milos power domains
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
 <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Language: en-US
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/7/25 12:18, Luca Weiss wrote:
> Add the power domains exposed by RPMH in the Qualcomm Milos platform.

\o/ codenames!

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 078323b85b5648e33dd89e08cf31bdc5ab76d553..e09552a469264f28952fc46c3ab8c125e87310da 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -217,6 +217,24 @@ static struct rpmhpd gmxc = {
>   	.res_name = "gmxc.lvl",
>   };
>   
> +/* Milos RPMH powerdomains */

I can't find any public docs telling us which SoC is Milos (the only 
relevant result is Bjorn's email asking you to use that name instead of 
SM7635). So for the sake of future generations could you reference both 
names in a comment somewhere? Or even the commit message would be enough 
tbh.

Off-topic here, but maybe it would be a good idea to add some Qualcomm 
platform docs to the kernel with a table of all the publicly known names 
for each SoC? This would also be really helpful even ignoring codenames 
just to know that SM8550 is Snapdragon 8 Gen 2 for example.

Kind regards,
Casey (she/they)

> +static struct rpmhpd *milos_rpmhpds[] = {
> +	[RPMHPD_CX] = &cx,
> +	[RPMHPD_CX_AO] = &cx_ao,
> +	[RPMHPD_EBI] = &ebi,
> +	[RPMHPD_GFX] = &gfx,
> +	[RPMHPD_LCX] = &lcx,
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MSS] = &mss,
> +	[RPMHPD_MX] = &mx,
> +	[RPMHPD_MX_AO] = &mx_ao,
> +};
> +
> +static const struct rpmhpd_desc milos_desc = {
> +	.rpmhpds = milos_rpmhpds,
> +	.num_pds = ARRAY_SIZE(milos_rpmhpds),
> +};
> +
>   /* SA8540P RPMH powerdomains */
>   static struct rpmhpd *sa8540p_rpmhpds[] = {
>   	[SC8280XP_CX] = &cx,
> @@ -723,6 +741,7 @@ static const struct rpmhpd_desc qcs615_desc = {
>   };
>   
>   static const struct of_device_id rpmhpd_match_table[] = {
> +	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
>   	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },
>   	{ .compatible = "qcom,qcs8300-rpmhpd", .data = &qcs8300_desc },
>   	{ .compatible = "qcom,qdu1000-rpmhpd", .data = &qdu1000_desc },
> 
