Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DEC2D46CE
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 05:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773033143; cv=none; b=n3pvZJCv5h78zklyUOFOFfW/QM8pUrE4bIXYHHYUtJLi73/W0li5pqFBNdUhZEVs8feFQzFSG4QM6sNGnlEY/0+YhYbaGhhspE25XahfWoY0J4KIEcG80BYKAxBo+Wan48uKuOaDoOrCrAxrNqm8u1ftg6NrV5SfQnvoxRY2+gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773033143; c=relaxed/simple;
	bh=h8jSNkOBnQ+GylGQE3LqQLFkNywKdIbN4DUr0Uyrirk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7yQWFn09MBW/C+PEUfwF4jLsc4FrTBuEpB5BsTFHuWtPkpvh2VSrrmCsr43cNX836kGrdQ0ZWmFlPr/M2Qkfgk4S6sansfvx/IcQgLZHfNX6PZ7XPgQOcdeNOIRWnBFeuM4/coSdVwS3r6rHtVpLToXQwnzpk0Igk/ElH/2FPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hllbChy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lb3Wfjcl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hllbChy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lb3Wfjcl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628N0hLv2661747
	for <phone-devel@vger.kernel.org>; Mon, 9 Mar 2026 05:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hr78HlUmGdHP31zlQxyj/wEv
	oINm0CJ5zfAaDu212cw=; b=hllbChy3UZMTRxQUZobuvrgFysQIGINoS7GIbDsz
	NBN/IlAairjrNAx7aEmj6hIlCyefyDJhgkfjDefDfxTmIhU9MTjbUpGj9aFO6MjO
	+dK2E1iQxpHePjxHNFb9Bc65C/MU579ExFl9RCeWNIn8PP9Eg+v+6qjzx8TUhDKW
	AW7CWy1VZM1sNCxp3UXRyJRBKnNS2HKjC8b/wBQq4nwbzu1Am6aQBNzkpUrXO1yh
	W1LxUnMR3o/BBRyIlZt+p77VW2RMR8tyf4hOZ5GTXZNA9arniE4qIn37SNa+Lsy7
	x/FYK9w3zuJjuBbzTjB3IJsBEabHxguOCgzawSgddAUcRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpm7jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 05:12:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso8930590085a.2
        for <phone-devel@vger.kernel.org>; Sun, 08 Mar 2026 22:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773033140; x=1773637940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hr78HlUmGdHP31zlQxyj/wEvoINm0CJ5zfAaDu212cw=;
        b=Lb3WfjcltY2H0KMWqiDmt2ew87FEJwm8oLWmHG8Of9ciEI6jUmqHCRpLUyZSlfbZmx
         Ch2j5RDoMVkHw5T/mkgolfrOInEUA+JPpZlBCzg5MEI0zLe3KSjPCeqPgNAdxRvFqHmV
         1Z32aGHOI7nQh1iPs1yPdUjcV6BxaSy/m3ZdsAXV0CyOvm8QvVHIw+d6iduzqgX9QJKc
         zt0Y5n8l1WA4zdP3S6B1s/qKardXOfRx+gQ1kNcG7BvhqToThyswAH9MsCvnHiGgHAE6
         OXPvpgy128AfomyJd97NoRjfiaxuqcH/fm/05r/fAh6Du0FIG/myps8RheB1IE5LFoPh
         SFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773033140; x=1773637940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr78HlUmGdHP31zlQxyj/wEvoINm0CJ5zfAaDu212cw=;
        b=nmSfDnlGl34FUbO8kL9mUjRugieZTgmN2M2oQ6B2cmCkuWsKACWLFbjQe6wtvCmgGh
         FuojD1UiNrOn4A51zcv9MPF9+ix91IOitBTbQcgnPiiE1H8/BUb24EySIFvHVoPp6cuy
         u5i0+cdauTAtyB7u7XEKlj/rYj0aH3yapCb0TTzjRk8zF3+3EJbKrIjPJMvasqPEfheh
         Oz/KEqn2tDfFuxeZEuCInSnwPh4GFYYcJ5+IGbLZyWI2fsA8AnZTKZD1GDxYuS65r4yb
         NAg/R5coxIHgJWPPIDoQ7WjKrXOTCWKJEt9oEWXqQWvI1r44qUao0UyJ8q4ZMw0QkWHE
         6dEw==
X-Forwarded-Encrypted: i=1; AJvYcCX8zDnBvwEm1ooooNpLjl87YIw3kSWEhNbuCUwzQDNxBSFu8B5ILS6epcrNqE2yLYTLw7QB5tvC0GYzjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGIhESh3TVGn/PSfF8SnJqpnNr+q4b2yVvJzn3LIBhQb8G0PP
	JCc5oepwUc7vP6vxWiqW0B/ksMXJme/dr3mf/tZVqw3yy9YqKxkUP6BD7e2qZlRFAzrESkwdBDl
	CcHaAUBho8dLIDF9VulkrKzJ2yzZar7dU7SrqmV0/6IhU0H4ngm9NdVTJNFK1EsAJKaYjJQ1QxQ
	==
X-Gm-Gg: ATEYQzzhfbu1M1O4yqKWfWIMdfKLroDilfbSaV/+Qj/DKVICB8UWWdNX6kPYVoWRdKW
	TdQeBLsxQSxLfrpuih6WFmt0cEuFIDD6XClQLR17aXIDxnv6OygWviniaxcoMaH5HQvp0HlRhVb
	3e5YPR0xMFB4tH6dZOIRfJmDHg14Oo7/tFdnWCZ0oZpbrskkUxSRGweAKIN1zSJQdo0oTjg4RI6
	agKF/UkCVCfd0bk8iAKFC3eFeTFEIU/XpeLCCmH321GVizCby6adS2D23EFR/Wzm3GiUpo52vjY
	8YuwPLaazEaAvvLNslWBSa7BV7uAw+pcAm3scwQWKnMoj5LL+AyhPWnLNOT/kn6nRtwP78hstM2
	zi8/DcFStcDynRV/Y1lWdZEynUQg4l0x1G5gRlfCNe6uJpnGklEzlprfmwJxZnCnJQn8ERW6ZNx
	hrlBotABaWrmMCGyvB3sJ6cu4lp+oqXiDvf9I=
X-Received: by 2002:a05:620a:711a:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cd6d3f0ad6mr1264443885a.9.1773033140383;
        Sun, 08 Mar 2026 22:12:20 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cd6d3f0ad6mr1264441985a.9.1773033139936;
        Sun, 08 Mar 2026 22:12:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a42074f3bsm12865931fa.44.2026.03.08.22.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:12:18 -0700 (PDT)
Date: Mon, 9 Mar 2026 07:12:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: milos: Add fastrpc nodes
Message-ID: <wxsormh4e5iplfa4vlamflwi7ye2qbn2v6hlpy35iegbinhuxn@ozrftvtgj3iy>
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
 <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA0NSBTYWx0ZWRfX31lcTFV9ec7/
 wla2t/DY1kHyutFsXQ2mG1IS31xqEt3N4rQY3mteoL05L9hKLJZk/U0sJUay5hm07VzyHVXr+MG
 83QxGiDZANz8FO8kHd8wuGYpR0XZKy4/pcEIqf1JZpyfyU6adYxXIcEzKB+20sVLLhPkf76b9DA
 4tB72FbPkFiBCxLOave2l2gQRO2JMjuwnLT1sMc3f0/XOV0No1Rhpp58iJ2a4rC+jHu8rci1iRF
 Y9wK4eUrK+7Us9UP4mgFJnjMSTqB2+JL8fhNNlkt/JPaJ0ix9FORpoO3N5Qa5a8/QOqjfCdKb3A
 BT/UXoVHnqLCkCQL0oS4YVYdLqogf8/f30LzX+GxBomWhNVp51RctaqpXhAVhWyBThs60JPuhKx
 3216F3BI9yMhbgE+l46BJLxn1x7IzzYoNJz0aoZNFVWLpP9BUj7meuZG1ajbCKdph3+BZT44ebA
 Me4uOAaSL66THTbBtKA==
X-Proofpoint-ORIG-GUID: kkJuFl2oVUCnp-skucGKp99kh_P5LGWo
X-Proofpoint-GUID: kkJuFl2oVUCnp-skucGKp99kh_P5LGWo
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae56b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=lN0czBGB9QGq1imfh90A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090045

On Fri, Mar 06, 2026 at 03:01:19PM +0100, Luca Weiss wrote:
> Add fastrpc nodes for both ADSP and CDSP.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 144 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
