Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E461B394C
	for <phone-devel@vger.kernel.org>; Sat, 14 Dec 2024 22:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734215236; cv=none; b=T9+lTa7rDebsJarIcpP74e73xvqXe4HW5i2Rt4rMSUYlDt6rhXykPAWrTcuRiCudm5eP7cO5ReIyv1SLxT0A4gTL0Ea/zdvcF5o9LVH7OpSMXs/zDZpBBmR4BwnLI0NndOnQDBj1IdeUO+hVV/ESoRXMV/3NcKr7RIlrEt5gmtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734215236; c=relaxed/simple;
	bh=4sVDpVE/Y9aJqvtHiq3xY3rKoZ6SRs2KeWCOfv+kYWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdJm1rIPbm0UFmWfKy3wCt3/GxLrXh/QuiJEN1B3zkT+Xmwnlr93AzRGcshFm/j0xZiuln39ob2qrgykpni7PoNhdo4lOKdb47OgtcOzKAUjQEJd0wshRfbgJ0kbfJORF3QlSMHCb9U1zxXKC6iSOaIjdAu5BHMa2XwQZuw41gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrfvVctE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrfvVctE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BEMR8pA024002;
	Sat, 14 Dec 2024 22:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUyEk9N0WDqw2fKvVZTkA/HKuvY5U21X3H3Z5ETR4eA=; b=KrfvVctEe4AEIYJG
	TpS7TtytxPjWgaXF8S8/0lvnvn1BmMySPmAQmDoT+qPl6eI2WgMg6DWsxpez+OP8
	0CXNwgdfGXXWo9N2d2knS+pjKjB7NSr9HIcYgfjvbpzTmqCtGisuYlOwkzb0jaw6
	qrF7nD/cCQUIhwAu8Xv0Jxevdn0nl25JEljxd6uNlM6f99M8DG/zk2vsaT15nynj
	gE6Cg7iNOFjq6N4kDJLmFiy2aC6xwzghNzNN8jQC3aWJs572pCQi72C2WskslAeE
	Juhx9wAFDsGXmoQ5zA2amT2S//s4adKQ9tx+5RTcQ6PgXYSG/zYUApn7bp4KQE+I
	+DZWjg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h342h3fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 14 Dec 2024 22:27:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d881a3e466so7895286d6.3
        for <phone-devel@vger.kernel.org>; Sat, 14 Dec 2024 14:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734215227; x=1734820027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUyEk9N0WDqw2fKvVZTkA/HKuvY5U21X3H3Z5ETR4eA=;
        b=Pa9iFu6OXY9H+IQvEK5Kafnp2zYQrGSuKw+otP138I7gS5/wEUX5etBj5v5PkCuQni
         LfdA570qduKfoNzuaSf6WHBu8ta7ojV+p1fjU7pbbxN2x+H2zKHmQW4QIXjueZ87XnSG
         FFjxPEFbvySshDx/6nkYau5SVDbfJXblx5QWuDrkFqlaPX6M6C0lZUSIRY6pkSiViUvH
         cPY5u7h+AHJjuZaaWhSEm/M9ya1A5i740xcDMkH4xuOlWwT8i+DgQ+8JhzjQHRZWKqvO
         cAt5t83IF0GKtcC0an7BE25QyFjIoH9g/qnEm3ijNtKbgc3y6dhEjgc3/rlEOlPDyR2W
         OzGA==
X-Forwarded-Encrypted: i=1; AJvYcCXxuV9WBDDF7AZEzjOwlhyt1v0DrGPat5/IP702k6IcLYBr5lCKumGrn9ncdYyeBdPfbwOLcK6JWBQLNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/ESeAsTSsBhY9n9uoL1aGWiEU2vpPfiDj2IFf7RfuIiGkFGD
	RDQHI9abLSrjWdRnPYm9Eo554DHM50pxOzzYeBkgCR4ugEcAMti5sffZ31q4JF9b2msGH11o6Ro
	gjkxbMfXwGLv6JNu9ZPf/zOFqjPd3jgcnJufR74bS/b6Kw295FN07/DD0xxh1PA==
X-Gm-Gg: ASbGnctKtnqFC+8ViykDfj3HEm4Zlq4GiHPAxuzMH4a7Gb6ZEBFRs4G7Y1gTim3T5YO
	PYMWHgsmPlRj0swew1g5nZ0N3uX66dNtDwFhyPbtzTVg55EP1xmbOsw1DrShfKQfci2Pk7NrNzf
	Oi/pnnEUaic2DHE4/KfyQW4AC+9fjB3gZVEYgEjIe8D9Y05/EY6urFPnc2jr+9MdwGHG+Kgieki
	AMwzClXNQq3tn9Uvva7NF7jZ9/ftnjy/+MPyTncXxURD7WnzyR/E/mQkLKNQc42PJd5gfqEpqBl
	M3HJ0l8i3zckQI3qCrSRbX/5ySdOi2A07Js=
X-Received: by 2002:ac8:570e:0:b0:467:54b3:26f9 with SMTP id d75a77b69052e-467a5748aebmr46264871cf.5.1734215226776;
        Sat, 14 Dec 2024 14:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/+/MeuL56FY9YXxGv3jp5sajc9lZ2F4Si/Byr9CgGpkIT6bqlx8CUjJl9OlwGEkZEomusnA==
X-Received: by 2002:ac8:570e:0:b0:467:54b3:26f9 with SMTP id d75a77b69052e-467a5748aebmr46264761cf.5.1734215226377;
        Sat, 14 Dec 2024 14:27:06 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963b4edasm139441266b.182.2024.12.14.14.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 14:27:05 -0800 (PST)
Message-ID: <81fb8975-3b27-4d4a-b04c-3535b7447408@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 23:27:04 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-serranove: Add display
 panel
To: Jakob Hauser <jahau@rocketmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20241114220718.12248-1-jahau.ref@rocketmail.com>
 <20241114220718.12248-1-jahau@rocketmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241114220718.12248-1-jahau@rocketmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kR10ireLEBSZOGTEohmwxyCl5ArVuNdv
X-Proofpoint-GUID: kR10ireLEBSZOGTEohmwxyCl5ArVuNdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=864
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412140186

On 14.11.2024 11:07 PM, Jakob Hauser wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> Add the Samsung S6E88A0-AMS427AP24 panel to the device tree for the
> Samsung Galaxy S4 Mini Value Edition. By default the panel displays
> everything horizontally flipped, so add "flip-horizontal" to the panel
> node to correct that.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Co-developed-by: Jakob Hauser <jahau@rocketmail.com>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
