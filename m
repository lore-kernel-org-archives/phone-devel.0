Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63490309EF6
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774810; cv=none; b=MVBmCaIbH59k95JiB5LWdY+EEgKWtlge6L1l5u5wJH6pcMEbbAZMXWVChsBW4DpCiFautEKavqTk5MRxP7itmugZAMWHdez+CaH/82n49VN7p6Aq0x/QQxyVxsw2m6XRX1ldHlhLEuheQcelLsfj0J+gFaMSWjJa9nXisiMmcrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774810; c=relaxed/simple;
	bh=54NkSaWzKBnhmYKVhYAafCeDsl+Vi7l2IbYdsfjy6rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPhDIerpaeFvDVQXEh88ibyJIYY3z+pbdJ9Ci7jGr0CEJ5RUMrqyeJlwIWca24uoVJ8DQOZiG5xky2djXH6THv3dHPl+Yms6GmR1QDRonK0nh5o4rb/8+KVpcEQCoBIMnmtrsuRYtKQmjOqLDUwuE6iUK2nFzc2GjWBBjnYOIqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6AIftcw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6AIftcw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b31507ed8so1527202f8f.1
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762774804; x=1763379604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8LJLkQlhnVDYB5WFdSOlgPUhT3qQ6T/PIi1MnL8a34=;
        b=v6AIftcwQ1ywkxLSX+uPqASz8T39pooRv69YFV1yTl5CvajDJ0hgWiE/hXWtrPTy22
         dwgpp3dRIxV/g4dJALmCl8V+AK92J+Vx0o9IMbrqwfnHycHPFFi3/SmwA2twiZX0pKSH
         mZKQjuMWQSn/KBCGFiKjr6gZhIiTuWmEWd0hl/MLyUdELWmNU+txhYzbFu7ju7PDJp6Q
         tmrrSxvC7/3Jc0Zr3NVCg0dXMouJj5e8lV+nGoaG4Rw4+w/4BloJB+VeqtXPWbkXHMdu
         V1T5h2I4cAXtV49mz0NZ7EHZK2ndRDwxK+kln0/sn9YKmOfN9Ra2feWsDg6l/ruxEuhw
         ANQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774804; x=1763379604;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8LJLkQlhnVDYB5WFdSOlgPUhT3qQ6T/PIi1MnL8a34=;
        b=CrqkojTdr7xGh/1rLyeYJ/ZnT5I+QsVGMbmnyYhMj0aKXDldIRWD7Y/CpUAyLv+t7I
         VIwsStcMTvyQnhXRouJMnpfw/u9AoQ+TZMShG8BiVRX6AEWDQAk9ipm+z/1O1uVjXgy5
         wpyxGaOX/cf0NpaIPDk9TPEOwjfz6AxQVQiOhTzdwIbKyDqmzwNXTY66eK+R2Trby+lh
         ukb3XmcpKqSqlAL7z5nlVwSfX8IhcTnXMq4Kyyx4mOJXWjR3ktLx7Mbxbxc20/tH3ZHJ
         yTijqBMdBJ2soHSiOyNShwpWuS8x3yew/zMvUvucLTfv11GVTls4+mIN7FZXXHG4d3J+
         wN8w==
X-Forwarded-Encrypted: i=1; AJvYcCULxsTkZvPz+/INZchAdhtSpj8rbJ1N4SEhJ3iPxmU8RCFHg/DIzXLC6wNU6vq1emTMaczu54Yv9KV3HA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj1dVC2eY5+TD15VcbNbco6nMAfsxS8uV4koSoFLqawa8dOKjN
	qd1G0m2zg3WiQXWki7ows0FzGQ9Wpw2rNqKB5C5HUcvl/52nPm39ZzJYvKl6U6mfYEo=
X-Gm-Gg: ASbGncukEBpzNxO+z9MDNgBIuY+SR8P+rC5tHjqG7zf9eh8nbfqsW1WCgkktTlQEMwZ
	ARHenQpMRfnrkmsw2zWaghLRc7PCUbnOwxw0bvD3fKQvjjV7cubExY9ZCi+EB0rh7yTquu13lbZ
	J8aAgt//xofHmg10bbayTU8n5IJPEHzokxwgp8430oKwPl71do7qLwSnjIrI1UPsX8jATgKud7w
	AEXxO8JEnRDHm4i2MXx5+nKrKx0VDSmFRhArwdBj1pirm/h4i5q00HjuP2Y/unIHY6qwwyPr5O7
	X5MIug6zyxNt+qvudjDb3ca+cRcOXLOt7GCtee5A0dRB3M+h2YuyIadcy035e2mQ3rNKxRZ8gSx
	2pJX1FiB685ENnXD6pIbjE7jTXUVA4R5Ndil6z/8L0I9Gc1+yMlxKu/7lPDB/BO3CzjcyuqGL6f
	zEvCKWjlklOwIOmXZ8OrHnnbp8eVoQZS6YSq0VpSgVNALY0+aE+yHt6fsWty5BylM=
X-Google-Smtp-Source: AGHT+IHc0y0L/IlFkDJCuI/XoUBdec6Dc+v/BCPlZFQShA4ijfqtxDc6+cizrEb5ne5sPA0PgA8OEQ==
X-Received: by 2002:a05:6000:657:b0:42b:3907:a38b with SMTP id ffacd0b85a97d-42b3907a591mr3013836f8f.44.1762774803631;
        Mon, 10 Nov 2025 03:40:03 -0800 (PST)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm22562080f8f.46.2025.11.10.03.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:40:03 -0800 (PST)
Message-ID: <f48bf868-29df-43bb-b1f5-d27f8ffb9d8e@linaro.org>
Date: Mon, 10 Nov 2025 11:40:02 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/8] media: qcom: camss: csiphy-3ph: Use sdm845 C-PHY
 configuration sequence
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-6-165f7e79b0e1@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251109-qcom-cphy-v1-6-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2025 09:39, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the 3-phase (3PH) lane configuration introduced earlier when
> C-PHY mode is requested on the SDM845 platform. This ensures the proper
> initialization sequence is used for C-PHY operation.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index c2adbde6b4e0d..03f5c4676e89a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1103,8 +1103,14 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
> -		regs->lane_regs = &lane_regs_sdm845[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		if (c->cphy) {
> +			regs->lane_regs = &lane_regs_sdm845_3ph[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
> +
> +		} else {
> +			regs->lane_regs = &lane_regs_sdm845[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		}
>   		break;
>   	case CAMSS_2290:
>   		regs->lane_regs = &lane_regs_qcm2290[0];
> 

Assuming the bool becomes an int derived from the define instead...

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
