Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D13B1C3F01
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 10:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690513; cv=none; b=HokyHmkuXFgq841zXUem6az+JhEGCeRzFq24FSLC9C0EGQP8eyMk6NMlgwAsTiyKn8dGvJ4pewfbnYrRhT6XhmgfWrjDlROB35dHb9MC/SLHx369/DUvaQYI79XxgVOnjuQBUPe1yLQ6BB0oTxvyzmJWuYDjr1nIKw8hfYZ/Vco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690513; c=relaxed/simple;
	bh=1hjBVCcUS89gAYDyc+pvRL1kdXckem1XTkgZ8bCc7Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LB32050X0TDjFQP4y4xUQfBBvw6fZjwaY0ZFmOAvWuxengPBa2MU+OJEgB1Rj3FEemgo/IBcxHXTXfReQKGpzTIqbcj10VJSeoQHVeFsnxNg7+6relBFXUSnna0BqMeyoLKNFSbhwbAyMFvyILOk8tyn0uPJVpyLuxW4hoSsGRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ne/R+R9T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ne/R+R9T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKA1Sac004381
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 10:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjQWa0qd5X0wQZSFo1zpsnnF4GInUf2OufuV4F6Rxo8=; b=Ne/R+R9TGe/rAt4I
	8gdnZL4m4HNlcU9vDI6/Ao4tHqnlb540+ToYBxs5hqao/bIZXxtmuLi5jLVgOsqH
	YnqhlXYHA6bpYaoTbceHUL1MLjfefiRnkOJ5HBKPge0auYoohHSYCyIcqwtShuBU
	E3k4gKG4QLblChNktt38+wVswowx9ZTTvnNu5tEeIS3dNN3JCA33xXSZHC1XMjLR
	Npg2MrdhWwHspL+aWMjdQrGvqLRAQuDKdHvt7kkZJKWwRd9g7LFyQH8Za+TgqkC5
	uyktPWL1XzB5iN6iCZQ4arfaQURLuOa05BhtvNfwte4/ijFLL+j/lB0QOGAjKUz4
	3e/Ccg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3mxrkf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 10:28:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467922cf961so4407631cf.0
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 02:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690510; x=1735295310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjQWa0qd5X0wQZSFo1zpsnnF4GInUf2OufuV4F6Rxo8=;
        b=uKes37M6QyCPNVuJxgDx5dfRNHxE7zhhIgNs8r9iWkmFdzCZt1tv4CqIc+hX8RigCg
         wD8WSE4+Lal+iau9Yhu8aQ46MrtO01beUX12jIlthAkcEyDx3oPchnfwP0wJmGgllWQu
         NnKA/WCnMAE484yLyGvqhaT14PW5Fq0w+e1hzlC+13RfCTtLzILAkpj9Wpb6X1Nj6bRU
         1Lf1dtHEkVd3kSycBaGrRgGMOthJWpAlMnSWmHfuU61ZvgiqkV/cRl6dOviafQvAEZcv
         sg2LK2gaaKe3ij6q21xx0RIQAklXJwoienL6MUUo6fbL8dF4I4Yfbj+Olle2rW+3cVQv
         q24w==
X-Forwarded-Encrypted: i=1; AJvYcCUWQVpNLrfJlaP7mqyu8w2679q7YYF+iYXu6O/9HYF/ZhoSfMR+leRWoG3+ypNK0n0NkDJ7l0ZzoNAVfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zCU6a8lxmOGZ7Ga3w7goPRCpJ2YKP6vZxPVBibc4wsWqd14v
	9Qq3qEXhzbz7tTvZDpdYwJEahDTEwgJRtDtI208icFDRpQMk3zSH54mgxWyUv+Nbt36fxMTaNVB
	Bc3xJoLnyYzqbs+Zak6LuTdX1ggdqPoal0asUBWefO4hvI69gQLNxgNzOwLUkww==
X-Gm-Gg: ASbGncvjpaOXkJ6034QRZZhAOg41UDHyYKPOw4gT2ILcNuHmgvZYfQWu/k1vRld4NKY
	MobnOYwX5J3px8DzKarJ4z7LXHh7e3p7OdRek4J5to0uVrwb2mOCUJ6sMuFRKHM5GLoofeVG5R8
	PQTw9QaJi+I7QbwkAZ5EYv6SzkVZjNHKSRWte1qIhTKj/sluP+dJKKkAUjuuj2khudlc9AQwIpm
	WPxn1MLZ4mY3JcNFwXZd/HKd3II0fPIROv8OszXJw3xOkzPQmZpzea9AFwBlEnIw2EbBtCFYpla
	9g/Svaw3d1Jy1qP4bhwIvmcfUSB0tDyAHgI=
X-Received: by 2002:a05:622a:4e:b0:469:dcc0:9b23 with SMTP id d75a77b69052e-46a4a9a3eecmr15332271cf.13.1734690509598;
        Fri, 20 Dec 2024 02:28:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMtjaKvTFUsh9ZDwXASae8DAiBKh90dcboQDUxU8iSgVq6zGvdYVzXhh/z0oYYZdIkXxgu7Q==
X-Received: by 2002:a05:622a:4e:b0:469:dcc0:9b23 with SMTP id d75a77b69052e-46a4a9a3eecmr15332111cf.13.1734690509230;
        Fri, 20 Dec 2024 02:28:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06cf19sm160882366b.198.2024.12.20.02.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:28:28 -0800 (PST)
Message-ID: <0f5f07f8-dc6a-4162-b9b4-82e40b9ca526@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 11:28:26 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm6350: Add missing parent_map for two
 clocks
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-1-64f3d04cb2eb@fairphone.com>
 <e909ac59-b2d6-4626-8d4e-8279a691f98a@oss.qualcomm.com>
 <D6GGBPC4V5XV.YU8Z2KASBH07@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D6GGBPC4V5XV.YU8Z2KASBH07@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VAs8dZEO0a-Z85B6rZ7Z7oZFVT_aVGd1
X-Proofpoint-ORIG-GUID: VAs8dZEO0a-Z85B6rZ7Z7oZFVT_aVGd1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200086

On 20.12.2024 11:21 AM, Luca Weiss wrote:
> On Fri Dec 20, 2024 at 10:42 AM CET, Konrad Dybcio wrote:
>> On 20.12.2024 10:03 AM, Luca Weiss wrote:
>>> If a clk_rcg2 has a parent, it should also have parent_map defined,
>>
>>                       ^
>>                         freq_tbl
> 
> I was basing this on that part of the clk-rcg2.c, so for every parent
> there also needs to be a parent_map specified.
> 
>     int num_parents = clk_hw_get_num_parents(hw);
>     [...]
>     for (i = 0; i < num_parents; i++)
>         if (cfg == rcg->parent_map[i].cfg)
>             [...]
> 
> Should I still change the commit message? I guess there's no clk_rcg2
> without a parent at all?
> 
> I guess I could reword it like that also or something?
> 
>   A clk_rcg2 needs to have a parent_map entry for every parent it has,
>   otherwise [...]
> 
> Regards
> Luca

Okay I suppose it's fine as-is

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
