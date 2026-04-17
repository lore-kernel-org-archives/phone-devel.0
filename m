Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C33282F2C
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468784; cv=none; b=sJP6CXNGNw+ou2Mq9XSdP+tOpn9zBlqqb7aUDmiRRdGBq4imQszUeYMHEQVAT2xlf0/lk1hULT3JRsvoOMGftDkxQ2XSnzq+BYcWRjtr9nQ/ob5giycusp3N3wiFbr0QopjRa1e7hlgQ84NonwOAzVsBvQMhiwmMkFzyQm+U/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468784; c=relaxed/simple;
	bh=i6Ol9BdX93JIjEUQ23dcMzbXsAuBsHsR1913FVpkpC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbIRPvIWWtuDPXt91NR4Hmnnq3YWtVOppAVFJN9oNZvkykrKUVeEn9I8UPMluFLdbL5GS/13UK2qbldoiIQk7uD7Xq4yil/UgplXR0iwnMX8f51nE2dmZFE1nFhpo/UbVb+sY2fOOD3eQJez87A750fqvuRjt8cFAPjmbFTnZn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6rweTyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ub8QcDUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6rweTyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ub8QcDUY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HGML6j3190037
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 23:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGUkS1YC38o59D8IELve7BiUTp/N9+xbJVx/QVtxOt8=; b=Q6rweTylMVZ9FQNf
	pDnMIB2twbmgLnNIvMdOBoeIRrzM+QHSUjgPs4uLkTYmoi5N0y6DmWKuMQ/3LBAj
	B+ATX6KrRo7bobqdn2YudN0rbNyL7wdwejz1+IhW3xj6qQDHXe4Pyp6NxWEVgdX4
	a/kIuQeA1Dst7VGI7F9EGkVwDTEs+tpIoKfQCkdoQS7sbfCGui0Wojmlrrz6xx/N
	xxONnDzj8hLRXDwnGJzCQYpSrkcRWWUUrOGg5d4agSBsmx+h9fi4qItQNP/dMB1d
	dnN8stLz6hEPAmk7ewquLgxFTEszK75pcc6cIDOeAo6uPGJrL+5YDrHOm6AmNmWK
	Mmw4lQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkravh3cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 23:33:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d76f460b2so34956161cf.2
        for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776468781; x=1777073581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGUkS1YC38o59D8IELve7BiUTp/N9+xbJVx/QVtxOt8=;
        b=Ub8QcDUYkteK+c/eliOJ4jNkB1qPMbpQZk4ZX+BQXgHVzcYlM3M+99HVMP+Tr+KH/R
         Ltpj4dOUfyxHG/BbwK0DcEdknRuCiLFAQ/pXs3FAE4cTcAloz1oOF9CkQnVf2Kv9UIa4
         H2Fmb8u+zY+7g4qI9u1WX3HIYw4KKzHkXixPociR2EWRnCbG8z0BWJAzLjRO1r1gZSmD
         W6/MVZ3lDVyA3AlObqZG3bioa/0f4OxahfgiakoC4ALEOBQUdSbol86lT68Rd6siWJSo
         5Okm7wzkRybSmy1tS8ruP6FxmHQN3/2Sld7NJ83dx+1pfNVTweRrUburc+Ebujy3Atgw
         tPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468781; x=1777073581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGUkS1YC38o59D8IELve7BiUTp/N9+xbJVx/QVtxOt8=;
        b=kVQronc0MkcVavIi61XPbYOa0UJCEDNSykCWGHrmyYpu5JW5QiZJyx961dYjS9j5wl
         Dt7A9JaNKv7PNaUTU7DVNH5/En6Y4d6xlr7ay8r18slJtBnbW0BxwhYPTdZ9iPhIiUbF
         DEQHykK+bKFw/EZzeanmBivLUIHb58ZV4pZQnwEBQ74Qjqbm72JJHoHp/wR13KX2thtU
         noCBv7ZuDCLH0yIYYKu0Iei6g9xtO/rhgWEmxZDcAuVoDYVc6acwYBZtndTvv1ba1Qcf
         gCUplY19Q2sJsjDJpsuBTwT7fSSk/JcWM7JFKY1yvccUh4DLvGMS7kAuvV0rMp23UHVC
         qJNg==
X-Forwarded-Encrypted: i=1; AFNElJ9Hc2kqulxrui+jLSj8EcnHxeHueFLpyHXdVsraAWKcSWRbE1nfqQhdwruaoBzC5ZZS9WOi4RTNfR08AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypSEWK0K14q04Congsr4ixz18QgyOoESS31A8czCEd/sSjxBYs
	uGB0L0QOKzazczoFCP1t3Vd3u/nWcaL5qXQpX0fX5WZnK6kTspHo6/5kZKjQ8rXzWt7Ud4ltcVl
	doFMZwdT7bj2/7ccVoz04zaX7nMdkoWoOknjUtYa+93RjngeiY5mrgNEBUJhBL/yTZw==
X-Gm-Gg: AeBDieu/3tnKzb6ButZPDrh7s43LmID+T9BGf60vgFvpAgE1U7GqS1PICRAS42uG4BM
	6wsEeKXMNX9MlWTZ52u/r51C8y6c5MOtLtQy2j1qYdExGhISBaQqcakViFYl0a9ZcHfXavDtyGy
	ykZMI+eCxK4afGbkxUV8KligK+dO2+NrWwhNxm2BvzPvgsyUYPwJ+BKI8Ap3Wh2os7DAK+AMdus
	1dp/lxHoeCFaWF794CUMBQbFaOeAGVC2x2E8SqRUcCozGwIu/z1h/c4o2gy7NM70Ud8qa295rV6
	GdZ3y+J904td3OV+/79lBpq9fj/rGOfIlzevNRrFTDyw5v5blKlLxVw7uBsTfmwjWa6kgxFL48z
	CqraYi6qcT5eLKp2+7t8588TYm+z9zkUgn3BwgqBVTmcpZ1NEEsaK6xyyH+oGWB0qs3w+IPm1V9
	DdfXfB7LTPkphRo2wINhZnRH4A1W3ztw7mk7tMTPqbm6HKYg==
X-Received: by 2002:ac8:584c:0:b0:509:3098:819a with SMTP id d75a77b69052e-50e36c4ae82mr70598991cf.44.1776468781426;
        Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:509:3098:819a with SMTP id d75a77b69052e-50e36c4ae82mr70598731cf.44.1776468781023;
        Fri, 17 Apr 2026 16:33:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm823884e87.36.2026.04.17.16.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:32:59 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:32:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 03/10] media: venus: core: Add msm8939 resource struct
Message-ID: <zhvfcwpy6z2rgpicnkvx2rg6huyqnen6q7imxv2fqjzc7k273v@oiqhebjgfnbc>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-3-a09fcf2c23df@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416-msm8939-venus-rfc-v1-3-a09fcf2c23df@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMiBTYWx0ZWRfX0/KqwoGtE2xX
 ycFBHpzA5z0jOTbU4aB2iYsHSIeCXol2FXKP7vtRxDd6lfJo7HRKK77xeDjyQV8Efd7D7qdnAzp
 tskocq98fdfPi+fYdSQVhBDl/I6q6Akkiic5C2CBmWUvkSWyf7RsFAy2V/h+Go0UnRNqB8H/a49
 ey1r6RHiyxdthqlPcYDp222WLZOqmyCbtT/o6yPgELC9PMwe2tgV4cj05GsbBtckeMaW9W/teVd
 AJuZBN4vK5iTRTyJlFE3Z2qXhZlCHb6PoWhoKRzxPphF+muqg5NXI3jfQ/5EtOg36u5G9ifgSWz
 tP3jyWMEBtp3pXp8AIx4G72BBj9FpYFt5zYH9YIcxXE/ZwfI/80mzQTU6JXbL3/bRAqGNuyy88G
 jOvMIk+QA3Bs3rKTy8gKyX3ldtCbn8M4KiCrMwki5J6R30ferMdOmvsUyc3sBWea0MUF137//6H
 r6YQMCTxBBnwbwpOSqQ==
X-Proofpoint-ORIG-GUID: JLPD7UPTTIvNbgvbrGou-bo6wVxIuYCQ
X-Authority-Analysis: v=2.4 cv=PIA/P/qC c=1 sm=1 tr=0 ts=69e2c32e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=HDjIzE35AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UowR2J5Dr4mKXK4zQ_4A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: JLPD7UPTTIvNbgvbrGou-bo6wVxIuYCQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170232

On Thu, Apr 16, 2026 at 04:43:50PM +0300, Erikas Bitovtas wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add msm8939 configuration data and related compatible.
> Cores on MSM8939 Venus are used for decoding, not encoding. Move them to
> vcodec0 so they can be enabled accordingly.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
