Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15623446CA
	for <phone-devel@vger.kernel.org>; Sat,  4 Apr 2026 21:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336730; cv=none; b=Vmye3C/YfHAHRavpsdPAJQ8CtJ12q7SciTi1ninl+4NdcmfLo8N3DjLOIfvLnwIe7IIYk27LVeXj2yF3gXncbR92BhKXgHMB2kb+uBJL9sNzG/iLDh70g3hgG6fqglChvZCqcXO147mxNSUQ8Qpn1M4CfVP/ZCWzHoHw9agy8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336730; c=relaxed/simple;
	bh=HM5G1/JGcqaUtlq8xyprvI73HlG9LDW3DZ6aIrro/U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPgbC34Gv0ByS0F2l5A+AKBjdXPnBx+8bmHlotR+TidA0JVU5N7jRVmISu/E53HWLAE2hkvio6hum9XbwEgx6RJJgJHkptZiBa1VnDwlaBhTxQbHveuKMnS0c3lkGmTzuXd8U56WaPxn6rjLFVAVPM+TykCyp0Pmgh/diDdypIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ7FaHDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy+F/4p/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ7FaHDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy+F/4p/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342Bx8N4114558
	for <phone-devel@vger.kernel.org>; Sat, 4 Apr 2026 21:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cTrkVv7RxA87UYtedNu+KTup
	uZyd1sP6sRCLIISx6CQ=; b=kZ7FaHDmLXN6oTi6I5w9qG25oUao+k+BaNrSKKUW
	uxoHpRmE/Yri3KEKo5BjwBvKhFmmew5GTPrRYRPmlRaaJK3is0cjoJLKAXPkZLiR
	/woeLPIlN/gIHsSDrOReZRXvN5JpEKHccvNU9C1p/fTb6i+u4GO3DekIaF4Im6qi
	nfwaT6/wvaB0uK+WuBWf3Ck2Q/tywv3n8CHka/yfPS5jLJEJvJOXDkxEmkIt8Djn
	KyFNTS/wmHc3FgBLyxpjaILtfXaUHNv5Ui1wL+/o+5QR9SPtLtQFeA0dTUIJZWp8
	uHf7MSsKiMXmLRZSnLF4Syh4gKPs1gV1YP762srdC03hbA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasn5sm8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 04 Apr 2026 21:05:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d831e8083so7311341cf.3
        for <phone-devel@vger.kernel.org>; Sat, 04 Apr 2026 14:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336727; x=1775941527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cTrkVv7RxA87UYtedNu+KTupuZyd1sP6sRCLIISx6CQ=;
        b=dy+F/4p/jHQEBWZ638NIkkB7NofQb0c7SigbRVXNvQGtL6DWUqqGfuS1ezve6PuFal
         XaPGOF1bJxK4m1fGl5NwhhZIcCfcLbTwTQuD/tCSe8tFYrFGd9rh2wDwwXdZCirKfIKh
         L1SOt9MfUojEU35oUZ2w/66w1QJZRoKCFg6vz4H3+XT6BlxN11n+Rjp4vcU0Sr2ZlP6y
         UgsWZgWSslGhKOS+QRchCbuUCnszZrcIh5ZM/nuN0HP2YQZkFY0vjJ705/2+Hd/ynHj8
         CeHMm1xj1R8ExNGnW9JXU/MQAgRT6DLpDbRTRv68zz9XKSH3cCNUO0NJJQwM2+BVAu9h
         KfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336727; x=1775941527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTrkVv7RxA87UYtedNu+KTupuZyd1sP6sRCLIISx6CQ=;
        b=PiAtnJFbGXHhlKs6dcZJ3kQUlaESMrFv+d5vJCoheInVKUE7KUhpCv2D88UuwWtu7y
         mI5qwCilCHjZQcQIWk20JhC+Mdla5nmtlaQhD3aysFiJv/2J010SI5wAnoU2TycuDzfh
         aRd6dZZxz0/qM15H7XE3ja1bIJvmudxhV2QUPiCaU/5vTK0WGCkRIn3mapbVOvOnymMS
         9ARAuiTm1ASd8WhYaabVN4M8cbWqqRIPMir5A5PqrgTb5pGajBUPOhWJ5Y3FEgyeFHH6
         1f0wwsSQg7nOaITsbX5RaKAcJldCviXdIEjDBx+B1hw9T9RlvRtMOS6c4z3l8UbCOohq
         p0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCV19f3BKenu9pXAl1eEddTNQTeBIQZuq2M5zuvSIH5JR5TddYtpVQYmWgn012q3t5qVnE63oZoHOI1gng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPOvdnmgSAOfNgWuGk5lB8bvk/16RhdEfKtiBOnj5FAspDUBi2
	XwB+oTfR9zn83FRXxjgObQbrByhDLn9Y4VqHkM2wiwal9a0uT7zmkrUlTzzwqq/mWr/3wVJisWO
	kqLA3dQ3ijAo25cCXqv1HOCq8A5MJqjqTS/eK4JqMyurLS08cszjd+nowgWjFFD9QSbEOLcbwpw
	==
X-Gm-Gg: AeBDievmMVEnbWFOumkKmp37c66qYT5k3cZbClV64NdPBCOriJNh0w0iUDdBkUKI6mO
	90ivVPTo9M8B56v8aHXDMU2JuebXbgwQv1E6QPnDXN+JdYV5o7tJkOETwS83ttzoDqynbCmodbt
	i6PTZYI6/YPAaICt8dPduQHWrnZFoC5kgRkpwktFt/nHLyKQUVT3nDYKI4sCKU2n/XYR7bXxXhi
	V9Wu1bg1ItSOrS7SCqUrKgQBYQGtyGrqU+WfaDCWdjxbM3FWRYgkcqeNCsC85LtHDRRH/JlrveW
	JZd6EiGCubLWzdALNAhltUged5UfqNKtDNy3k3upbddyUc3PHaSjz2cFFXtmTN3X/KfBJxw5esa
	GVUy2i5th3Jo65F2G0g+IUam1RwgiflA+kKti+yzIw+oj0PSciFVVbzbYKHzwcYCewBhdaLr4tl
	UAF15fzVoHz0RxRJPJIgNOpXpXGcpJWJtzDNQ=
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr22878201cf.20.1775336727058;
        Sat, 04 Apr 2026 14:05:27 -0700 (PDT)
X-Received: by 2002:a05:622a:124b:b0:50d:83de:4933 with SMTP id d75a77b69052e-50d83de50cfmr22877861cf.20.1775336726595;
        Sat, 04 Apr 2026 14:05:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cb95sm2274374e87.23.2026.04.04.14.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:05:24 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:05:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sdm845-google-common: Enable NFC
Message-ID: <3wejnbgrlcyagt7eqhrfqm6ih7tyo3kfgmmmvvwf6nqdr4y4bp@rhuihdfu54qd>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-5-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-5-fbdce57d63c1@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX/0QybRI4LIuT
 w7ywMsat6lffJ4vNPqAjpBkDUVgBrPkbmn6tw3cfkEWBmCUFXMTwZqu+XBjoy8mP+3okyFYw2A0
 3fUBOj8iIpjq3yy9OG9O/AlM7jAmv45jxqwChyR9HIp5AHGCK5psK2lkwJq51I8Zl9zAMyfIC8V
 RkZCEn2PFh53NfNg4901ANIOZP9xGCUOOtZs9avQo4tDfESlxelMbTaRQhV1dBZd2jamJGOx4oQ
 rDgAfoVrIpgNEhRkCrbyNaOpiXDFBFjdMwKrhvyeBguYwmmFfY1HGmtrNp+Y3ZnzHvWRKJUu24Z
 ihGU7SHTRz/3BCqaKf/HJsBO5RnkzkXxOc+VEwxcuswTEylVjLbXiexdQvu4NGkNDURcprq1bzq
 BsjvtKZJCioE18M9tnaJtUrdcZQHNkXsCETDYIXJXvpj+nDVQ3Gx/fPmlHXacriuPpqjaR4cAHZ
 6fq/PZyn5iH70q9UMlQ==
X-Proofpoint-ORIG-GUID: h8j941-o_1Q44kLORnBLaK2pTuwekfGi
X-Authority-Analysis: v=2.4 cv=K9wv3iWI c=1 sm=1 tr=0 ts=69d17d17 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=k9HIGDZ-W5ShfVvnVaQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: h8j941-o_1Q44kLORnBLaK2pTuwekfGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:50PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable NFC controller NXP PN557.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
