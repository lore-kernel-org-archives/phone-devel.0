Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6740BCDF
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274112; cv=none; b=PVgd7Q+rmxeCGqUjVFcNn2m3yrgRoiV8Tmfs5z6YYdnMTGfKTDEmx0H0R/dbocmq/46Ioiwnkm+3lpB3nHd67qAnhWDOYzAJST9RTrjLRFrjnvkHoVO4r9pdbzzTim3ePgF5CEC/BtE6pTUG/f46xILxMUMLUOPuIaANzfialGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274112; c=relaxed/simple;
	bh=LP0uWxHLg2fsBUx+Nhxz5x4jEzYpXsVi398yoS5Be9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP1eXuI9X5ukKP3vygPoNW35kjDYEL/xCBzt4lCSFrBOiAvDZSYaIfjCxA3UTgG9LC0QaTF5M3pihPtMU1DCMmrZpEo7eQdIFsuWfld1Uz1l7SfCODR7saTIhRGUv0PSvB6MN5qMKCpNdaxn1UQo+5DNxdqaAFHekz9Wvg2a5Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmhWIFuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2iFRi5q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmhWIFuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2iFRi5q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8XDK2145823
	for <phone-devel@vger.kernel.org>; Tue, 1 Sep 2026 14:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CKlzrW5fENrSL+csftyJo750
	ANxO2VC1yaUCUp8pTAY=; b=MmhWIFuMCX93Lrfk4+dD6ikWr6fFT4whLHqEA4+r
	Sh6S6uBV+G/1XoJo7LoU9es4P80RrRLNPxeJ0AaZQhVCNWNmwIPTg6d6lL5s45xI
	fqBDc4K7H/HfNlE28Ho7GhpMbh0xD3MN1tEYjn4hAg0yO1163ZBUmoVZQk99QOU2
	KpHFHJOWhenRAZ/R8oPn6172CgA8+P2F3Nu5sqYdEjrGKD0+yjh5Nl8Uyfrm6sGs
	7KaVH1pJw3JOw2fIcD3DMuvRVo03uU36FuDEgfZrToGKiUBCwfoP5tnYnucRincf
	v9cccw+w4ngu2YKnSm62TWXmArnvgsWlh6px7yF4PP1xpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8u7vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 14:48:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390e7e4c5eso179259385a.2
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274109; x=1788878909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CKlzrW5fENrSL+csftyJo750ANxO2VC1yaUCUp8pTAY=;
        b=i2iFRi5qy+YQuHnlNbzvlXmsfz8P+spL+CS6DRu5K6RPBEiqLHNav4MWoH/W9y37M1
         q+UPaZxBvm6CCMecY8jHie4JBeQG7e/1O/8XwSpIkVjBO4lt7OmVUZBlioFXWpHtIwmO
         WEEu9EXBALRX0AjcY2Sbnt+VWJec4mBSMRLnf1oDf3UqzKEPRCgKMjfOn5BE2MSa1KEn
         AzpE95AmfdvThFXvPp8QoeSD9lnMyUKqA1S+6w7PrZURLfNcPYXzT4/VMcIc9bwKWdrN
         lexkWGeLznqczr++h11TbaMCAH1g8Bs4DTB5fuKZMyd3LYwiuPZIA5P19FL+qyfK+ote
         XxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274109; x=1788878909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKlzrW5fENrSL+csftyJo750ANxO2VC1yaUCUp8pTAY=;
        b=DYEYJ/4dsOXSbc1++0jS/CBgsyXIoQW5eCy1WRFL39o/W36u64zwrj5V7zan3SsqUm
         3l5yZ46EJDddqVXQkd9bh/lhnO9PZ8bEBhX9fwqihpKcbvukwS/XyH9CEh99jnEbFWMa
         ivS0aDQKQQbod5twNscrwqRg7Lwnk9EbhpX0j7VPTJW5jNj1Idtx4Hq1PVKQaI9Eoy+o
         3tmwQPLcUDXsOKkesSWn5IcGSnOwcQ+OA16r+Kz/4PTrlCoPb+AtKS9qU9g1rqxsidhY
         NPVStC2Kg28ojfFP8Np33ElQdur40U81J73fuVsrMJGCZFn0171LtxJhse4Lu0aWYT3A
         qA5g==
X-Forwarded-Encrypted: i=1; AHgh+Rq1WyORES1pNpCSRxtRu3BCFcCblKAdnOnp9LTJLWRaTy4apI1CM5wjdXIl0kXkUBBxhVv28Uta4/6Ejw==@vger.kernel.org
X-Gm-Message-State: AFuF++m9Osw+CpFgy3O7BsDFj0dqTsy2kbATIqB0qTp1RCxadO/NfJt4
	rMkHbHTNeLB7PZftoxDOL5iq7pXQIXA8lCpZ08KQt93R3v8qQRTc2skboOrnH66/zz86rS9ssln
	4Um3qr4xbrtqKgr7S3oyenc1N1dXrINIYvKBTmOpUwhY4X6QzpO+1uAseTCo+eQlOYQ==
X-Gm-Gg: AR+sD10Z+mL0k15baFBTrkh/Z4g5k/R7t7KJvDO2UiyWXxgH7j185SRzNBEX9lKc9NH
	Vdcu22GtD+VeQRFXJMdnKhXaZRLzGylNHco1JL9JbW6uUh4fhxnsD1n7bLY+HeA9bgj2V8AR0it
	jcuT1xjiguHTZZN5dhADqm/CkrCcrYjWm9vhk9kgCqwWD1RloDefQMLAiXwQorXw6+2WbGI9rWq
	Oa7Zv/XCyet/naH82Bdig96IvYlWrqUjQCIiOXCz2CYhII6eJbc5bpgVFbeGypkktiwTABOnTUo
	aFv83wiat28RZ8yZTeTtmltvsb0bOHvbsI4ZDoaLjgexb0hdp109pi7NXRa6OYlfG25V0NehKK+
	UMVnquGjpqxkkT/U=
X-Received: by 2002:a05:620a:2b48:b0:936:ce17:dac3 with SMTP id af79cd13be357-939139aef87mr4237794685a.40.1788274108680;
        Tue, 01 Sep 2026 07:48:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2b48:b0:936:ce17:dac3 with SMTP id af79cd13be357-939139aef87mr4237757285a.40.1788274106763;
        Tue, 01 Sep 2026 07:48:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e9cfsm5661978f8f.22.2026.09.01.07.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:48:25 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:48:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350
 PON
Message-ID: <bw5js2yqngqpy6i6rli6ufaaiz65bqbpcaiyfnaur3miuiaq3v@4qjmukimdbn4>
References: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96e5bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=gvnL6on5FGTgUggAsZEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX+GzpzyEkee3H
 Kr2UtT8zqiMEzn624RlcGrzf/af/u0uh2VlPiV8Qju263196nrh2TKsawOAteKPJmtcc27Z1Q4H
 +ZxQCtUm36d0/hGUd0WQd7LOubPFuOfD3UgJfpmwBY2jeg9jzHLxasG5Tt5iEyHUDkONhQVij08
 xdlFVqDtjUQhzO4pE68HIpvJ0PKa6Z9JkJOqH0GxTVBgXgrDV3F3+7abaTG8CC760hRbGkhecAY
 wdnBxRgQi8qLh2+1lFHfPDS/7iVkjw8NC+MyxC9Yuds4fbiMGbDtyAd29T9+M7G9QaeaxuyflRH
 Tg3li0rK1RG+4nDlhNkiRHvsgYO125Yiu05merfJZpcdFMTMsTY5vIZvmp6mOYC0aHZvBq2WlYr
 QyaRvEfFielaP8yHv+l48CXJLImC8Pb0r3dpD/Tf3P06OLBRSPARA49TRYW/O377YYlNF7BV/Cl
 CTzx2nEnVNInv4TT1Yw==
X-Proofpoint-ORIG-GUID: U_zXNAi2PEdy1raA2WegTRQ6_1kG8FqI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX/miju+fHkPyf
 OGWzIVqv5DG8DuoSBrlEmFhzlJbYpJJCwA8HD3TAjIqcAj+5jmjsucplIWnv56ECfLd91kudKmj
 9J2KTGWnRK0c2ZpqL68QcA6M4rGFvo4=
X-Proofpoint-GUID: U_zXNAi2PEdy1raA2WegTRQ6_1kG8FqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010131

On 26-09-01 11:06:13, Luca Weiss wrote:
> Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
> one should be enabled at one time, so disable PMK8350 PON and keep the
> PM6350 PON.
> 
> Fixes: 582e7c1026fa ("arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
