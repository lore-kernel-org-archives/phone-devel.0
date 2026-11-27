Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789569;
	b=z6tx6FA2h2GHQ9+GUR2oArenzlJhNzP81GUzNH3Mj6WG0vhIblvB2dIG6mdQ4mqqp3OX
	 YjQChSmEJ1M+MeeBk13Ygb+H7e0WP23U14ozI04S4gdPwuvEaTZ9lFNShhKSontxpUQxE
	 u/HEQrqrp/msM2dm6+ELhcbDeh0i6qCvUULTQE4PxsEGT9B/3yiWU8Fr9zOM4yz1fFWPh
	 O7eBxydC0SrOnbDP9/6loETe4WWxu1c1E2AuEvj8YciDRhUseHQCODrIiQBCMesFGM9v7
	 +q0PpjL3KJY5xrWkHlLQcCSFcjr+AV2YqDQ7pYOgrkjqcvjZSgMMXJ4oq0d8w5rHitQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
	b=Mb02btZsUpSqmUmy5NOIGEmN0p8XB5J6+C/6RG745o4eh3p3SMbS52InozWiJxm4Ttjo
	 MoaEtv+Zwn2v/55KhyWsP5Eo9YWi77Ox6QXjT8h09p4bNpq5jW3WSW8XniqMYCIyH6Ako
	 dJDSWYT9rHjDDIIRsRuVC05BDBv0bSz3HQRk88v64r3QU4vlqraOt815pEYnp/l+7Q9Cw
	 9jBwViHom/6N3ADYrs5rlJVL+2KoNbHqgbm86lnFxW0OwikaKARIaQFpA31leHEp6HFpP
	 TFAY/Z0yGpxAMJESbN5fBciPpKuTl71ikxipS6MAwaFq/p66vu/vGObOdOJAS96ppbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9OyCWOh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXGQtXxR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44197606B432
	for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 14:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44197606B432
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9OyCWOh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXGQtXxR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Omi1462689
	for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 14:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=; b=A9OyCWOhxbNrnNBj
	j9QsIzGlTvvelZiXk7G6sfyIvotoJBnaRafsAYfleP3VDnfNZGyaBLOxdBoosuqo
	DhQYJN3Rm+ndD4lKkmMPEBqJpR7TQJUHfNFuRk8MChz3U9QSbjZFqVXYLKXsI0iP
	3M8YDl3OgBdR88C2wpHB528xoNGuET5iDhh4XwJKqq/IlR4vX5ALLSv+AD4NtElz
	nSVJgU+Sp6iZD46sA6ee7Y+XdGgIkO625Bd18WByUVcX+LY+n8yIG+XuXx62PUtu
	F0ANFbsQ1MFTO25zz27EWezgHKYj3t0gw+pRCSEFGgu90ePH/pVXy41gwfaBikUJ
	u+wOLw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqmbuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 14:26:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecdc7807f4so366429e0c.2
        for <phone-devel@vger.kernel.org>; Fri, 27 Nov 2026 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789566; x=1796394366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
        b=QXGQtXxRgRfUPqPPaSa5v4NhJuVXnfedKc9zW2WBcM8D7MBIObheXgTzU1nVB5/3o4
         y0EVDV+juXL349kJMuzcipVHtgZ7hvowNlbolPdMrrh3tIKH7oXtamvVvxZQQ31QJFbT
         wO0lbyoUzJf+zeAaekHcSqqflPTOzeHB2Arn19Dh0gOCBF0TBmLFHpmAfUjnl9yJkRKd
         Hftc1tgroYfLbzp0vApqPX2f+hA+F7UlKKnW2EhQz/p/MZF+YMSJ/mWQWyCr8hiT35qR
         x16m67yddyt3gSeqNojp7cDRW0pE6mo0fH4yX8/RpyTEQ7fCQHumIDsJ8eFyV4WgzrEt
         mJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789566; x=1796394366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzYuLhRqqKaW9hEOxxw+GIHo1wvo7VBlYnFTmaywNh8=;
        b=2fm6H3PHgts4FZ1I22ZbivOSJQ8hvjGre1fQgawNsb2KspghovjOBfo9686pI569/v
         7a/R7c0rY8cUh3lgtmz5bZOza6SPPxfQSPJkNcAuWFcS5NIvN8obHRBHLPQV49KWu1wN
         VB3ffGNvxaZpaoq0l778yNBlenGpbvsr7XjIHRpgbt0JeE55gdC9dGqVibKQdxa4Enq8
         Xw4qCh0hIJOv8CrKu4aT4tOopQjb2TqfGTlzLaMtL2I+QSO8mA1baHmGbnRldKlJmYp1
         b+KsEzPFLdQ2E5sQxwoWjZOKb23+vzQb10XtCWjxxyD4L9lOqVFTRKts3R+PuqlCAUeq
         1B/g==
X-Forwarded-Encrypted: i=1; AL+hErGXQhzHtWNDupun80KgkaylCPLF1lYHY6zbT5G+qLOueet+Uzv6Jpynbckft6kr/cJB/USU5mUzorSjAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fNn8wnceIZvapGH0wX0NrJiDO5jW/ks5/yMjX5zrwJFKEN9TE
	/IrvISTGMkT8WLbVW0ouETFt38WQuH3lKqdGFE3ZjfH0iQZPRFva6VjevFWyZKdwigYtiv1N/p3
	/3hB1jWIkmOd1e45gnzAyRjm35k1rH7vVcu1d7SYpHbIKb3aaGmcH6v2yOP+QWUSRwg==
X-Gm-Gg: AZFdTZcFbXX+WNv+coCrnawLaYImsjxixplLKSR2r18AVLzgi+fth5rL9CtA5NkchV7
	Za3j8cbAlrGB/gxngtB2hPLAD/YtR2AUMmafsOUF7Eitgc5qGHmrDEQWgGeecpTK+Y4zMZLTExU
	TlKUBsJTYxGxE0zDW4M7PnRGYTd3I8/1Ox9UMSUSdrqQ2/eSQVL2us7R+68IX2NG6L/F24TNatq
	0FC2kFR55WUw1fanyk1H0pfsJ0ldC37LyWMLivuRupTZOihrr1/iXElZh0v56l9QE90JCDxBUkA
	nt8JMPxMGz/OIVOqP0BJSpTFEFer1I2njS+Sc2OBHnpdJkkq7aD1h0qiDngyUoDtfOCkv36QKHY
	l9CUyEZQrPf+bNeUluGOyRDLlZ9/wY7REpZjHwMDn6lGnUWvSD0/zUm78pZ5o0a7PFPFoc68=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr17109618e0c.3.1795789566422;
        Fri, 27 Nov 2026 06:26:06 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr17109554e0c.3.1795789565824;
        Fri, 27 Nov 2026 06:26:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm871434566b.19.2026.11.27.06.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:26:05 -0800 (PST)
Message-ID: <2b589a52-de75-40c3-b4ae-3960b9068cfd@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:26:03 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg-judyln: Drop qcom,te-source
 property
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amir Dahan <system64fumo@tuta.io>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H5kMLfCItW3jzW2YaWM5Jg3fnClnp3Bc
X-Proofpoint-ORIG-GUID: H5kMLfCItW3jzW2YaWM5Jg3fnClnp3Bc
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b0992ff cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=bCXaPUmJWq0JbFlovXgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXzDy0lV6ixKmP
 9hLeqaNpWGf8InUOTtEk2/w6Vn7pHM02nVX0N9nazfWGlv/RHbYrT0uGJRakPoTcN+PerbygQXW
 3M7dsAv+6dCDpn8MRFm9Icgrmyou7yg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX0dJiVgNSPBfR
 3n0KBdSlKp/PwYSSfaYy7SnLG4xZ99l6WYi8LRYtq1gaI0c3IlP5P/1Lw7c+Nlzuo0mRVaUjnEg
 P3FgJnd4PTbWyEPd8m/Ha5upUfyPcg/dSLFeZzmtkhPKeoilN+pKEB+us+D0rg3riNXYg5z3+Hd
 krKc07nOIeVw3SoGsgfyxMO7Ug1Yf3ecEk3kWpH+3dx1E0P86A3l+50wtVB85VSQzU7AHxbr8LY
 R52c2Z40FdkT0COcIAaKSIW+pn2e6MIyQRJ28EMxj2oJ6erxpyVczTnkUhFOvnP+94ulUv17RKU
 1FJ2VeRETDsVgi7w1eL9ma9Dw8Eg4Z6lSY3iNCCnoP0Bms5N0rMQj/9jJBFdTpRrF+jiDkcbo1p
 VrVobOYaoTEvLoaz2Q1RU7vN/JIpoaiZ8ZelvbdVHfyDnWtIufaH1KJWUKCJJMrKnmffFJEvCsI
 /QyAazz85pAwLzLLSRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/12/26 12:53 AM, Paul Sajna wrote:
> It was introduced without proper verification, and causes
> graphical glitches on the display. Discovered by bisecting.
> 
> Fixes: c6c66aa3ef33 ("arm64: dts: qcom: sdm845-lg-judyln: Add display panel")
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
