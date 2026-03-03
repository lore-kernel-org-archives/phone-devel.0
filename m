Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E885394482
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532506; cv=none; b=aiRrTb/Ym9xu9Y/SBaA0VUk53eIzvX95aUI/DJzeI9rB6Kyylx/Le8f/eWUB+/Pop4NzFIeCaYWvzSFJG9dSjNMEStrpRZcMQYYSIG6nBq5zQQh1hIimPfKq3P3Eo9LJ3Slf7wesnZsWzki99erzBYkgyofgjZQWXCIy6DcoXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532506; c=relaxed/simple;
	bh=h+2GcRJgSIlqWkyAemob1F5MDWMzyrig/NBRlRV2B5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8NxgBkdm9S3YOPN0yDLS2OtAvQzbWUGQBkeP3wepjcbM7V1nT02/IUTsLUbBHyiFQDrZavBcmHbKA95Jjcqcqh0yG8jLNLUB14/eGNAxWN1aTI5twChSrJHkOyInmwAtSU1OEE+EmOKa+rPtY553xmqqmex8zAoTorPbw32WlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHf2qfDA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHf2qfDA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so65606775e9.3
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 02:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772532503; x=1773137303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MyO8nnua/YSeSGPvcxsWXY2ujou9FaamDCdW2t1bD3o=;
        b=DHf2qfDANg36y9Rwv3qwwWio2pnPckeigVi8u6BZQKPwn8J8qJ5bjfTKr6Xv2RLOtx
         CdRz4E6vmfS6asTI8Eto2wSJuRwvR3ywe5SDxsJsf3eGikyRGb7l6Pe8eezu8UAY6pBO
         ZLxEZnQY35HeJnY2Plb5oUnMnKsDCY0vzABgBTxiJ7BZuTJFw3pFdlYfoLjfltXhOl8M
         7B0uw0ucufdTD3qw6qDgEvOP93dLVmCymPlSmsbabvLXSfLAKp+86hPdIa1T00DajGgm
         fxK+hU6u45AQsUS/LPE+6fGDJZNpcfjLK2kCdUmol4CJwuZWNsWZA/yuM4PvUhrZf3CC
         gSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532503; x=1773137303;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyO8nnua/YSeSGPvcxsWXY2ujou9FaamDCdW2t1bD3o=;
        b=H+qTVGvEvYiox8vONydz8RGcDoCH4C+rEI6MY3SdBRq6Q8Akp3Njh2UR4WrgXyeEm3
         xkRfSxgEobTNXFunbKzR5RtFefYNTX/eFHne004BnPfsLbXR9gdfOpCF20bLVwrF+GMR
         3V1VV8mJFM2arq0NK+yFzxWP8gtMw9rsYeHEf1IKTqkzCHZaSU/+pb2g7szKnWg/+rr9
         v8Xpgr7Vevsnhohv4KnUQQhje4lbn/AAk9nqvc2sqRJ7HGt66Ggfe9hKGrwIL5JB2fTI
         l+cOVzLviX/bgW+UqTeAqJM8pxFhdcF39EvPjUWZOpHDQk2hl8haKY4xM2WI0QrndYs7
         Gpew==
X-Forwarded-Encrypted: i=1; AJvYcCXZlXrMmob8aYCyGMHe0zcY5b0wK3C7lEZFcqNR7xFFchNckU6pGl7Un+a2a/5Wfj0VEQTXrHjRiUbDjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIrmeEFsZNjgBwaHk3tHZx7/cfD6MlWMSCxxU7ASIynW2/0sIU
	y7Xj5Cnlijus0RMOJ7eFo5VfvlwKVZMiToLbzstiONieVr5Dge5eRcEH/xA6BflxFv4yIgaPZwL
	rsJ2UFw4=
X-Gm-Gg: ATEYQzz8+wGtY7bL93bItaH2B2OJuhJpFsWLDLXqGwBPhb00eZj6EJgiPJcZKpIOulQ
	o9S2mMeAbcc6nqEsdKjrdV8KLx4svdVGhS69GPoIu5msPdB/poJufg4god0/M1jXcDz1kPXG2og
	DUengPKhonmGiLdNYVF2895SJ8NJzGabuD00mRtpAZU9gfpWwNS9vxV6GMPbmDXLxydPloY7WlQ
	ZxUuKc+jCjCR3og7K8mY0ZPytkkKuIbISZNWuXK7TaVMu0ncFoAm7g1uXfwpBOzE1lbPMJSPr8c
	6sD4v4zJYw9RGRNnkMFH2ejKm/+L/iEncmgHjOxwHoIOx/fFRvtrlz8Xp1KxjGS3s5Q2HFn+j8r
	qMUHRJ6HTbJZmYFx0jsi11fnwfVrlqRcYNRP2xncTXA2dJGvCOzyiulecjNgARfJpVxp0wuUnTl
	6Ani4vQEbWTu+c6nJxAn8chj8Qvp6FLh3Z3j6xyo/dFKLuVuves/pxqN3PWmC1zc9E
X-Received: by 2002:a05:600c:1989:b0:483:71f9:37f3 with SMTP id 5b1f17b1804b1-483c9bb663amr273676705e9.1.1772532503534;
        Tue, 03 Mar 2026 02:08:23 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48512628e2asm31393555e9.1.2026.03.03.02.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:08:23 -0800 (PST)
Message-ID: <be4abbc8-414a-429d-baff-48c829378a31@linaro.org>
Date: Tue, 3 Mar 2026 10:08:21 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2026 10:00, David Heidelberg wrote:
> We don't have any documentation how these lanes are set. I think it's 
> good to see two working variants, someone may need it to demystify it 
> one day and the history may comes handy. Also both variants works for us.

OK sure that adds up keep it progressive so.

---
bod
