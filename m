Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC6043A806
	for <phone-devel@vger.kernel.org>; Mon,  7 Sep 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770245; cv=none; b=q9cOCkE+0NoRlZ62AsAndRttWeTbIkRUAaTKO+tIaIcT7WLJjjD5SuO2K+HsaItDlyQyZ9e4nwEFLR9zpUK/IE7ACI7KcAPlQp6eVsFCH+6G9dhBL38URtv/voY2oNi6TyJqwvvYcrUbd063sZZXAtPrwWT9w0rITD3v0K6erKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770245; c=relaxed/simple;
	bh=ISGTU9phKiGuZJOMB/lKhUY8x73F7vPwxlZHgCas4m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zqb6l9RyNuK4Lpv0FFY+r4p2p2c3WW9doX6+UuowPfWmTnrD+PHConMzUfOcPeZq53wgrccIrbg664qPsGjJ1SBjQVcIbHdf+JTVt9O9E6FhKa3+9Ch1VIRN356XRCA/KyFuEZ1ozcG6pQlOmenaATdj74Z2yanQ1jzCcZMZX2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmhrzLCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfCQDeqC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmhrzLCB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfCQDeqC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777L6M3352428
	for <phone-devel@vger.kernel.org>; Mon, 7 Sep 2026 08:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRLzrvO6FEqNj9cDHYnJGMFdaDAiDHxtj1Ll3bHtQC0=; b=XmhrzLCBm9dqDXKW
	bZCoDPLIg+3mRZgI+NcNjORKSX4Itt0+y0mkkYmUMPEm0V2cwgz8Wcf9/gNtkvgm
	uvgzcc9wawYcxPhQC6YCXR+KvLZp2+BYHddbiyQQyEvBce5BoYIb3rcxrkwj2l5c
	iCuqF13GA5PaggeK5XN4B6ML0Ly2Q8b2Mb37cHzxQ7CQILg85L5Tes54fICblQNb
	zQ7hf1DkdQhhknj9SMR6nwHvcOJHt1fkdxDBockLhveAyc+e2xD+ryiQp4rVtDCD
	DxBQ97zdUjwpJuHz6SfxGSacgQYL8skH7nNCv+uGotnn5sgpiX6stW0/I7Z4FiAq
	uP2XKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gutc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 07 Sep 2026 08:37:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9310484c005so41701185a.3
        for <phone-devel@vger.kernel.org>; Mon, 07 Sep 2026 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770242; x=1789375042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRLzrvO6FEqNj9cDHYnJGMFdaDAiDHxtj1Ll3bHtQC0=;
        b=UfCQDeqCqv/v2ujUaN51p+RLl2nG6Dczh+PoQ1Wxwovnc3kmFalFzDtTcYA3hK9xCJ
         hUC+QVFAji3SPE/0+Sxg1iEArmh/O5U4AZraqy66c+/BE5OzsMeBEmhfkE0agBBkwlol
         uI4A0C7eY97hUpb843sLuN8izLyDVdJugnsIsMAjXL3qMhBEHJ26We0yPj86FFXOkjYE
         gWxX2VqT73swgXcOPRe00QDUb1t0EVferkCX3RYNr+kfwVVKxXATJMw5oaIL6QHsrHW/
         4dGF21KLSqJeI58we9L/vCWOQjUFNFZjj6N1xupoX744eI8vseofHNp8jat3cFwo9FGL
         1Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770242; x=1789375042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRLzrvO6FEqNj9cDHYnJGMFdaDAiDHxtj1Ll3bHtQC0=;
        b=DWlYuV93D+HLGsxKN5CajxqWRbYhcsN1KH/dOTck11UOXmvMgvRMhwBYjQ15MEs/I6
         o6WFdycjPerFiwtNGh0kN94H38PMR0gj/tfeyRJbfz5CFikoD3xDbiXX6mSkTmyRuP57
         7+rYh4ayzLhwgQdyIND2BU7AWnNs+POAEf39eVCjk46Tak8FzCKssOSTStWZpjBnQqc6
         JGfO56GLHK1vNzfL2Fzajag8ukmm0nsr4sQnA8klWyB9P0GQz1sVZx5EyoxtTmGSzFpY
         pcnfquhzcYnajgTafBJuUFcRndQxPaaSIW6kNq7D2tk+wXuq1vM8N61DvjU8SwEpaAcF
         pldw==
X-Forwarded-Encrypted: i=1; AKwUvBzjZReW382J0Slhvq3Rq97ReOptNH9jSyuXLxoRt/9Lk2284//ri1IPOtpwxQXDGIkE/ltzqFCO27q5Ow==@vger.kernel.org
X-Gm-Message-State: AFuF++kV7/0a79c1q0tX17RZn+He7M7ZSrvHPjN299vMXZO0zeW4jOHO
	x64R148le5uaaQjLX1GlMl9xmdeVO1cny0hVEK6Jejg/NL5fV1pBepQbQYOehhexEZhEyKhTI+U
	puEupXm/4CxBMF68yhNX0D7fMhw3wAX8byKwF5GikEGIrswj2mHpIFtiXQQGUWExOlQ==
X-Gm-Gg: AYBFou0Dc7+AbDm7GlOdGtfqEBPm69LYeVp7EwD5f9PJkLXSrGOlHSq87nhlWQqE5qC
	2pWGOUPmqmvT8QQp+mlp2DRWMk3anaq6UHQ5rD8zP9WD26LvsX8o7ly8x7611MY6l/KQcm/sYCi
	r/KqvgLIAyRcnG4E4LK7dk8BIwsXMq1h3KsTI+1RjZahW8SW0VuXDpOvenPC8lyHz/9EGEX9AIg
	DNf672/AS80mQUd5zjH9B1ZbQhK73OycidTxz4jEiu4UHUj4faFmDC7BMJHTnO0QvgQgAV/cwm9
	ZtQtQymXjNcJE64CrmnQzm8GF/HDm4tg1hh7/YVKoEbmoT5LXMIMCVbRmzYEfNV41juiLKP7sjT
	UKz/+0FdvX+mlx+8XVzPYRg==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1680141185a.1.1788770242003;
        Mon, 07 Sep 2026 01:37:22 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1680138685a.1.1788770241666;
        Mon, 07 Sep 2026 01:37:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262f97f1f6sm265914166b.50.2026.09.07.01.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:37:20 -0700 (PDT)
Message-ID: <1fd0036d-7dce-4826-8366-a695c624cbab@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:37:18 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Add modemsmem for Google phones
To: david@ixit.cz, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e77c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pyxf__bKPmsAz4JLUVQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: x9Ywb9koCZKaJHZUDdZFdJd4IGKwJ2pi
X-Proofpoint-ORIG-GUID: x9Ywb9koCZKaJHZUDdZFdJd4IGKwJ2pi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXwo7xXpZUFvEX
 ltnC4SIA3XpAU6auPmO5xmoK4j1L0w9V3UTAkyyd5Q0lnj3luWb65yurggq4vkULcvjbqQJ6D5y
 ImR6KiMekSEXMuD7Oa2xVF456R7SkYk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXzvZz8OymjT+m
 h2geLV47YTYnfqtqlPHcQoHDlfwcePGfFDmADsJH5UH47g9WHGFhAj54rZutbj42yyuyO+oUU+u
 sF1AzNXNDsnnMObZhWUwiTRgJDT/94vXYkNkjFsjSyRUBxo8XMLVJ+1TnUbQfJZ3VksIogqrmiD
 +4KnseBGz+b/lBLCH6RtoyMereMi6t5eIYy/vPuy4DBCDJ+12qFrWPqkZFPANhMNSzGD8xGy2ug
 EI/19s6gsoge0Y8nhAAkEtfr71J2yoYCykijfMWwai6fDzUPkjGH4OFDSHNeax6Eqrn7ho0mot/
 /odrLlQvTmpQgNJ9sI5zrfcnwRlenfOHWOn1L9sxQD3NJpTFeU0wSjJF+KLjDcnmEoG+8OLyO8+
 CjmlWJBQpyoz5tleeZ1NyfWNoGP1Demk1a4zAnN5pIYg+Jqk9BjpxbUQsIguBc7X59CVW5K4jJX
 liwqS5noBuqmPZNdcSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

On 9/6/26 2:41 AM, David Heidelberg via B4 Relay wrote:
> Q:
> Where do these types of drivers go? This driver is probably providing
> info to vendor code in the modem firmware, so it might not belong in
> drivers/soc/qcom/.
> 
> Maybe it should go in another directory, like drivers/misc or firmware?
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> David Heidelberg (2):
>       dt-bindings: soc: google: Add modemsmem

Would a list of machine compatibles be better suited here?

Konrad
