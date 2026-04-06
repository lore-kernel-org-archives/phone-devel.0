Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1122B584
	for <phone-devel@vger.kernel.org>; Mon,  6 Apr 2026 01:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437663; cv=none; b=Fe83idw648OOf0SNz2u4nDobC7Pl+CNaMLD9hnyunSXwTBrsGrX/qdAn9DCWJpKYu38p6F53D9bgbmKkP2LEretO46XAHIiSZGLuHUWaiCYLfFdBitObD78bZ0yd6aF+HkDfbWeGsMtiMeb3bVPf8p1Dlnd8Y91Vgpm6R8dFFtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437663; c=relaxed/simple;
	bh=MKJakbcmNxzxGdWfBKjHf0cp3wZmHZVEk+QzobVnXVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxegBn+gFGkP4D44PNYGB8vQqChtBA77tjIxhPByg+MQlrR0raMaHw64KJOw+ddnnDmRcaWGmOSYTtz6AlEKWI7HG3BtPDc4IS9JY4nkk6kXiKm5CLSN2y4tyyPMTBaIXwgCTTf03UwIg7ljSJ024g029KbHBY1FDxQo4V1h2/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTPczUXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+44phnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTPczUXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+44phnp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6360YVpY2410468
	for <phone-devel@vger.kernel.org>; Mon, 6 Apr 2026 01:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4f0uJli78TMMK8KUK88YYviB
	c/HliRox1MxKveOYlmM=; b=pTPczUXIatcGJMEZcoduD+/QPvsFTVa+j1eCGVQ8
	PH7VCTCjxNLeLEjIIZcBrRdE6h25tTMuaHdmcIiD9r8TIo9n12KVi17xaZgLdacE
	bJPBu2wKnp2QvfBKyYL9B8VS1k2zpXBTZUgua6n1SZRnEXYA+Lc6Sd51BC5HW1iY
	pVbGdP344h+40xMGxzg02ctlfDivc0vPS5xeU74VGZa+v+wvv2mVkJV9ajlyACs2
	becXaxwqiZuCoN1hvsvBM2gw7a8SJdVfElIBjA1Pib4hy0Ddfrp+ZYvHBL9/Tv5v
	vd7FZn67xzW48uqTYvG76TcWc+0nAEZIfF/uRklTjMNvqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrkkpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 06 Apr 2026 01:07:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so84209541cf.3
        for <phone-devel@vger.kernel.org>; Sun, 05 Apr 2026 18:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437658; x=1776042458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4f0uJli78TMMK8KUK88YYviBc/HliRox1MxKveOYlmM=;
        b=G+44phnpEZfuPJxkIGCMEy3RIEJR261f9N9o2/lw4dJ21MnvaIGY6v0Y/p7XIO0h+6
         Qy3lINdpO1cBFqZZvBFd2xwfO0Foy7ALjY7NO9uUVj/2p0YimZPlXkuEIOgzlKDBMU62
         f3y/+NSPZMHeom9SjYpH5JeTe29AVcDZSBJvm5nkLDRSBVNKps6qHnDdjf/DHt7Dt+BM
         82Vez80ECagMidU4Xj/SoucKjh6ZUBSxHd9wWZ6SK3qgIxDAtIPiOzEefGvDMGmZ01BF
         5a1XzTf5V3uaQvBdWR4GQMt1u8sQjrLBysoJ94vTzYBqx2TfkM50I5uPyUJKBRyLVwpr
         p4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437658; x=1776042458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4f0uJli78TMMK8KUK88YYviBc/HliRox1MxKveOYlmM=;
        b=Er5lfG0snaM35si5i1morRINlHePetfN8RoZkJzrrKVyQMoPbkLl93TQA5M5potrnd
         b+K6qc4L3R5SsYajVzxPied/p6hzAhGhDd+Yk5Qr2W4pemS9QCpDpcxDHbDOdekyhXf4
         yCyCE2PDH4Iv8ttr1yLmSUswkTkEqf2/pi6w7EZRRSgqqbF9c1ptndpEWpVo2W9OYX4v
         S+7Bll5wezR9ebDNcaOAFRQ4X3rQkUQVG2yG5VqdaIATF2yyEdatwcd/x2jvxbW+Oa3R
         dxFAkVjFlot7uudQryQ+QyPBYYy+oGeZIcTzARuaTb71JFU/R6CK59psfquug7DmcowI
         gtVw==
X-Forwarded-Encrypted: i=1; AJvYcCVJaeFlNZbKG6dk05JnaoIqZP6YkvGJCmW5Mwfs7QAtyWkzCIVST+OC9dHcn9w7+XDZUYMdMtbicix4vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPd133xM09He3sbS1Pyii7BNHeG1CniyHsRLyZBUuXDU1vEwT6
	glpWVPWxpCgpX0L4merOVSb4LdbqV8InqfEXeAFxunw2Phh62O7EegKdr3I/ZS8d/NHBKm0bMYr
	sXbqsyxR+l7SlV5g8zJDcoOvOmP8z5/fpvrOSionLmIUUO2n+x80xqjYlc23/kVuxkg==
X-Gm-Gg: AeBDieul9MJ88cOL1ZQD6H9AyYcHT8KwFoL/xegFoCFunvJzb+OCOyUmtwolfFYSLWc
	LUS4EfigHdmk9/KgyxrEOXvk0cCrtTh9MmR6iwfI+7k75LtvNJjQTaLu/rtoMFXo6Yj4g9TGKQD
	NwdpgpmyDOHwWevSyX5m7Hv3crPgOYuU5S1/bUTtfxlu8YiZ4pmoq4417FwZKkB3ZlaYrLjKEXu
	aFNzLNdC+Y7wGRn2WWEThVjOqz8PCFeHTvXwwnx88C+ciJyYHpSoXO/vN91JQ9XwJw2yT3FxkEl
	fhMAh1K8wCy50ql9ojKZOBBKATMtRivjY1jB5Tm+bwuFgo4geTkoAOTV1jhkzmOwbonYEBU2q1N
	JF46pVUUkqKEQT5GHkxKh80kQtRFqOV4uGZ/nslm3ajs5RurKPeYt6pfwecbLH5GP4pPXkioKsm
	9YUl/rief/UYEK86+ofj3w3sC/lsE0fx5uWn8=
X-Received: by 2002:ac8:7d02:0:b0:50b:444c:e268 with SMTP id d75a77b69052e-50d62b4bb01mr180596501cf.19.1775437658528;
        Sun, 05 Apr 2026 18:07:38 -0700 (PDT)
X-Received: by 2002:ac8:7d02:0:b0:50b:444c:e268 with SMTP id d75a77b69052e-50d62b4bb01mr180596211cf.19.1775437658103;
        Sun, 05 Apr 2026 18:07:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdff47sm28106631fa.13.2026.04.05.18.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 18:07:36 -0700 (PDT)
Date: Mon, 6 Apr 2026 04:07:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iio: adc: qcom-pm8xxx-xoadc: remove redundant
 error logs when reading values
Message-ID: <ddxrfazpcyert6m5k56facwy7wq6hlji4fq2zotb5lfgglxzjf@djr3uwixhvi7>
References: <20260405-pm8xxx-xoadc-label-v3-0-9fe179c283ec@smankusors.com>
 <20260405-pm8xxx-xoadc-label-v3-2-9fe179c283ec@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-pm8xxx-xoadc-label-v3-2-9fe179c283ec@smankusors.com>
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d3075d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=Jp7DWZVJ8eVs8d99wrMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: kauTIY6ZID2nsIclxZf4IBCY9w9v9vUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwOSBTYWx0ZWRfXwtBRFd0Yx9Un
 Tw0FV7k/jAm8fxGRIfmiuLbjnjPkrXkqz19E3H8a17qeJ8yPX/BGK/1LnGkvLjH0neBqjZpq3lY
 BoVXDxcutjxTNyIhzCAoZJUAjYJg34oPIZY+y9Wnxtz865SpCaq0BEJmY0izH4OUf0cj4/msMWY
 baHmcDYVjXeh8uJs7jn2zo8c40dsjhaSMRx/+Wo8qg31Qc2bBF2rNGe/lPQfEo3n9su76Pzuzg8
 MOAq5LBiqeAHZd/XrHAZTU8gCRYrK4m0Hfb12E/kVF4Gt2SJQYy0AK9QntGSeN5wELDcHCKK0m5
 YJykcOepxMURJ/LI91kU2k9TVhZuWfa5xUdBCuv/UdvlKZKn4cLxGpwKLq8O0I0zllCE1noGSCK
 qMcQdRjEEbsURYFzc4UBz4rIMLbLtFGsGOoONDZragmGgHpHf1UFf7JlDc6ZBhGQLzWUXEyf4O4
 DpauvrCU/zbwcWjMYIg==
X-Proofpoint-GUID: kauTIY6ZID2nsIclxZf4IBCY9w9v9vUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060009

On Sun, Apr 05, 2026 at 04:52:18PM +0000, Antony Kurniawan Soemardi wrote:
> Drop dev_err() logging for -EINVAL and -ETIMEDOUT cases and rely on
> return values to report errors, reducing unnecessary log noise.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
