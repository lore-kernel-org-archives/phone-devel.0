Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9BF34889A
	for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768255892; cv=none; b=KDWs5CFzRmyBUmU1ZQSIEguSp8LSeVzfwB5dHycka0jHiOoX2H/QZtqduw+k54RfMXzklIIdJ8xp7ZRbynatZdD04FGvFGTVif7E1QkYtJnweu2GI2uUm6KKJR5Hs0v+ptc17REMNgq4+XIcGoFjX1R39BFzSz4Teg9kZ9OD8vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768255892; c=relaxed/simple;
	bh=Ij35304MyVdMGpBR9HlVwgyCpE8KQSt8d3JxqXR3QrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ig3c0jXmgl7yYHY2zfeC/wXDKQruR2F3GMSoNiuAS/HN9iHgziVlr4ZhIhSu+KHdKbd5sx8MAd9Djw+4y298/scubS6XuQh/PblIhWmEeMDKLvMkd5KXjYD2XQ8d0pWXLLGKWocUG2qac65BOHGWOr5Oi9wj6dEOFLdpJIVl6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5/Pts4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwVjLOCl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5/Pts4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwVjLOCl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CHf9Xe1426476
	for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 22:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhEhZwjw8HgyTavKW4D9RGlwsOdPgS5h4taGGLgVlvc=; b=T5/Pts4XE6rWmKAx
	R5hKrYgRuXwJKvNQ7/F8Qv/meNZkp8t0lQ9EwDMeiJLBmx72R3dDbLVgSB5zIjnS
	0EWjJ9WBlP6kNdcLdGjBDAYn0YUPS1bOysMakSnV7F+hGSz1TZv+Cg014gd6MCGn
	VPoTesCNO9ECXmuvxRW535qKYp1r5+dfO/TK3UfHNpbph2G6M4PUiREWsN92r+J9
	jZQ+YFjslOXkvXS3GPoNnySlOs93ZGurclPSW1cT3B6uj57xZup3e6yJ1pmVGFn6
	ywGA2rKri0Tzk7uzHifdI4n9U+8EDkNKHeWpJ7rlzko4f8IRan5CZbJhIT25w0Wr
	l1S8RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn34g9cfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 22:11:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22ab98226so1951692285a.2
        for <phone-devel@vger.kernel.org>; Mon, 12 Jan 2026 14:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768255890; x=1768860690; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhEhZwjw8HgyTavKW4D9RGlwsOdPgS5h4taGGLgVlvc=;
        b=kwVjLOClcceSzxEXZ3l/S2Xjd4vIc7iuL/sLLbZcckiJOgL70YrxeCcA8o1ej2JisR
         fVW0TLusUPqMeHxGqM9IhMlkZy7aKzGVr5JKUZMuz2B6fh8W/3wlSHcWbNUrZ9gKH5LI
         lPyQizsHhtmFVbTZIqv4O3MS5hIaUXhu9DUfKWZj2g8z6cr/Myf4nKGGSsZ++eEEAjiy
         Potx5hxgQf+oFTC6lV13LnEcd21AYFDUY0LScgibu49zV4lqTV4kcfJRRyzGOk32jtLg
         xmdj7oOXpuoYl5Saygv7JPoCQmNMhepi7gsujgcK4gDFLT4gErmj10Po0our5MVVwbjz
         WKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768255890; x=1768860690;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhEhZwjw8HgyTavKW4D9RGlwsOdPgS5h4taGGLgVlvc=;
        b=JamAcyHMdvEAhASMK9/rfu+wSWjpXoqAINMCiPqIAC6kcWYcVIZlQY5mkQXLpC7n5I
         XxGGjirgCvxyYBLqdpes53o5wmRSWWgvcRZGmhPDMj57rHuJYxtIefxrpEi4tPfm6XMM
         BgOt7B02ubJ2gmJSe335/kfbH9d9jBfFd6fVDui7iqoTEm5he8R08L/w+U0RXCDOVjjz
         76y+yZekhCP0g+wjtIs5LHGKmGKwhLDCjNJlHwiRLK1EviudOAocX4V//XEHZZtqlujb
         rBIsojq/9rPb9nUsRF63rToSlk+HeAvaoanLoeYeORzNnzf/MBrG/PDHOMidOucJjgEF
         IrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx43CfF8tDaFxDACQvwzYMOVlqC7vH6S0SG4mfbyiq82SS7QD5MP4BdxrbsENYVejDijj6wJLKdAfocA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3YxyVwOLo2k2fy7g6E3GJT8/bhyrr1Pp7PRuyKkkK94OzutcR
	oNO1XpaFhbG4JOxPiEnhAy6bXQkTGEsxykv80rSl2ZTRAy5YLdi+7MJymyfcB3bLhgYBPLREchf
	UQiQgPBj4ZmNQjS2S+yeFyNI7q1ZZX8nVwEA8zj8BUhMaVz5nrjQalyl0ZIYSwVpg8g==
X-Gm-Gg: AY/fxX4SF1Pv70moBzTv1EPQ5fJqKl44CWf6mp62fH+b0J0BsszmRHt8sCeL21oMnQ3
	Nf7DzuV7ZIiXlyHqG0dw9BctNqFt5n8wFuSGk/tgLnXKkwGEjBlnNMPjTzvzYJMlGjQ/2sAU5c/
	Ds01ywX28/jqK1gM+9eu3uebYrlqqJNfLpIW5unHmgEQNkvx5akxR0cPMjPhUjby0BlLmhdgA5e
	c9HVZLrK6hpJAc2a3YfSFlNH7OZRz5RINftCWfIiYNGLlkUZLFhxBAcno++TDz442rcAHTfcCCs
	D3yUmmyv9znPFGOwOFrf1AkrQiYjKZ1W9gNBtCkO02dtG4opM1tW6juYCcGTKbA3BPeZ/BlfUp/
	f3udRZ0IXKshZ5kSVYNrSL/3JYHm+nHI1boo+QOD+vXxxSsjHlKIw8W2aQEzaOwmrQcKII3Iy3a
	ljHnjAcJVcESXvrxAejj/qXLA=
X-Received: by 2002:a05:620a:1a97:b0:8c0:cd96:9bd9 with SMTP id af79cd13be357-8c38942954cmr2803828585a.90.1768255889749;
        Mon, 12 Jan 2026 14:11:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd3WmM8Er6jZlz4GY+Gci8L3m6OdKJ6zduDCwmHM4ZmhRoP3rIVclFhmckVLuP7QTQ+XGYYg==
X-Received: by 2002:a05:620a:1a97:b0:8c0:cd96:9bd9 with SMTP id af79cd13be357-8c38942954cmr2803825085a.90.1768255889303;
        Mon, 12 Jan 2026 14:11:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7868955fsm3403076e87.2.2026.01.12.14.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:11:27 -0800 (PST)
Date: Tue, 13 Jan 2026 00:11:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix msm-id
 and remove board-id
Message-ID: <6mxiysnjmrije7hz3opgaw3f5kn6p4glgoivxvnizrkjtjiywe@5qgj4jxfxa2m>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
X-Authority-Analysis: v=2.4 cv=fbKgCkQF c=1 sm=1 tr=0 ts=69657192 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=4Ix3DnIw-zF4zot3V68A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE4MyBTYWx0ZWRfX/xA7hF6egBJd
 W/pamGNEPa2uvM2VCpK3kKtdzb5fl/9PoPdP+0Iw1HVxBQGzB2f7YiE78vxc0ZT/5WJFVNfoDcg
 fEYmXDCiPLignM1xQgecI2LKxdwnxgp7ZOMcJY5C9dEEtnXbMddSN2RFA7Rbb4s1S/rErjSsuCp
 +kTczDjpB5Q6H4tF5tksIWMhKe7nNWrXE8KlTUSNzbiezdwSk04WZWJQzOEEohYv2+T6TVEWbZ2
 Y5Rhhw+NyuT4BKxq40hzy1A/b0yte2Nb0MFrZPkZ4+i5IQkmy89kGW/xSFzPRNcjT9rSBb7xWiO
 WNZFqKeVFUtq/dWgsjgwmGHUOSybG3THS3fVwZj5y3ZaNVNRxz1nLMwrAgaMGg8IbaRrk7wKnm6
 YPPVV5+QPQ8u40ixhOrWgcIlWxzeotwePjcIkjTPOsPkkWNSbVC3QobHVv0Y2caZwWtUev3Za4Q
 AOy4mjvI1FmSM+2troQ==
X-Proofpoint-ORIG-GUID: Xb66JVRfddRto-FTBI7obJpYFGpiOFPL
X-Proofpoint-GUID: Xb66JVRfddRto-FTBI7obJpYFGpiOFPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120183

On Mon, Jan 12, 2026 at 09:13:24PM +0100, Barnabás Czémán wrote:
> Correct msm-id what should contain the version 0x10000 and remove
> board-id it is not necessary for the bootloader.
> 
> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
