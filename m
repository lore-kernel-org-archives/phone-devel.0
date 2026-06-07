Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249FA3A1692
	for <phone-devel@vger.kernel.org>; Sun,  7 Jun 2026 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830935; cv=none; b=aXhwpI8z8LEBnQAEydwqC2cTOYqUFvg5S1bEiLUDdkH7OJlojg+KN2FiGP17iqrowaTFSjbVF820+BdhPPK2KL0wYchUSaTbgG6KZLBS+2kLyoob5KWFWYMMCO83Kz4qGplN1QUAusvif2jYf7JUXYC35xVfjNWYIzHyqKYrRmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830935; c=relaxed/simple;
	bh=IU878TfwJWjEzViHg7yoM85ADerUxuFmfEEp3heHIM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cm8XWzuhOP2uwfRiQ2Ph2JlCg+AJpCE7blW6X+g1D/8p0oXW2Nq+VHJhktxMwENBcWfrxm7HkxQi2UJUzTWx7xY7GxTQnT4bmW3XT/DhQ9zAOcin1bscVkjqO7IHPR/8xSQ0aTQK16P54wyawrsOYrNipU2uiawI9EeiIwTxEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgNotiYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SG8g0njK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgNotiYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SG8g0njK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B0SJM4116075
	for <phone-devel@vger.kernel.org>; Sun, 7 Jun 2026 11:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tQH54m9TrZTMQRynVW84/hWI
	Q9TwqqdJmnTFXIMCgzA=; b=BgNotiYabJwDU67jsdEKqsjHjfHMX39CCvNi/6wt
	seocsNnlcGyiiQaheQFpv2f1MN5OVkp4yOHXU+93rt7EPAl2xDsD7oKQebYTZLE3
	s1eyW8j+9R6iC1ADS5oa8Ni9U4/mwnEjsXqRP8fL7ygA8Kxvfc62GLJg9XGXKKnB
	ZzEC5hPOZYTCmKBHlpXBkoUCe9FQc/+sCumB29fIyjhHQlUJH33OSUUpJEWdclIh
	uOo42c6+jHS0vMea6Y16crDlfG9aQ05yRT/MWt+3X+85QcJNRl2RxaN/6ixwcQSf
	VAEAcfsuMYjLpYG0bPEnkjpfNY/SdgUEbSfS0NPB/Aqn5A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadudps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 07 Jun 2026 11:15:33 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59e6c1217b6so2647878e0c.3
        for <phone-devel@vger.kernel.org>; Sun, 07 Jun 2026 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780830932; x=1781435732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQH54m9TrZTMQRynVW84/hWIQ9TwqqdJmnTFXIMCgzA=;
        b=SG8g0njKVuil/1wfORaH1qtTJVNSUXxQFrDO7eqjJbtJMQ4k+qzHke/XxJ2muFHmqM
         qkxKirSKkhMEeOpBLSVNTX5m0zTX61e49Vi/6PsGIFHewIz/7596okNeXrJ6BDTZN+Eh
         qomL6s2jKQ3jQoMvd8sPP1kaEZUliUwariGKUbWG+WRu68xXRXFGMTBwoz+sUq58tfxW
         5f8VZVSkFvCbIevyRPoNVLLX6bdJfY+bcGEzb/0n8mewpUJ+VxMxGH/kcRJ6mYrxvU1H
         rSJV8OeWRgEfKZ8V7gclGSxrOKRHnOv/PuwtrU+GNt8PxqOzVSvxohAKoXiVqOz0VQph
         WpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830932; x=1781435732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQH54m9TrZTMQRynVW84/hWIQ9TwqqdJmnTFXIMCgzA=;
        b=il3rv9Pu0j8Av+eFTtF5sF5+sxt5a3zvPqKR/t+glppVbFxOVNa5jg1408QDH1dLea
         brr3Oa2yj1+IB3j0z322nis81EWqe3ZFu6f0Rc8maB3Es6rlQTuJfJuEAKI18k93XK10
         6BJCkjUZlcEUK+ohSWweRxrlbCuFnCcgKKkkShBHiy7wn8Sg2FF1BCPLDE+ZHsDRjtQb
         cTi+vRJVHKFQ6LNz4O/81ymnlsMVxCsK55x5KW03FfrYoUgHYWcn5DAHTeJu0e/u+HoM
         sTltJ2OrIT16563a7iFvAS2RfE2Ex95pVQLp/sA5/syp9jBTjzkye9Ic9sgox1V9kctc
         NKYg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y2rn1ZAHgVyTbOoWj14wMwzNiI2drd4pxca6YyUVUgoepR6GAaEJr0KKpqoFpecYXMR7JlkQinoLHIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZfSo0LIIqDZTdJvZLBi0hXVB9VFQax/a0rdcOrBOdtGAPOZ3
	ijvlQYFiZp5eXdRC+y1UQLM/+vLFeEBFUasS7gvBsvqy9mqHQZlAEe2wnedVAJDlsMu6zooJTIj
	VXB1XON/Dz2i27vNt4TkVOEpaz/qSM0K4iwHVtkeTqmT4GhZCdwaE+SrLHrGCIz+Agw==
X-Gm-Gg: Acq92OEr+t6Nu8AN33hM98RRBsMmcdy2LpLt3HtCmEkrC7XLsGtHmRA8q7Qdd12d1DY
	Ri4hxU5Fh29mMVSX+kvnUmAOrrSKngHAlbQYFj3nYdp7Eaa/tz87XAS35N4V8fGRp59TMU6Y+9U
	FMHWEj+xpHgs0KDRFVVbjVDBXB1iJ47JEb1iB64r6eZHVsDLDw4QIVD12CaaFyLn3kO9zgWL7Ii
	ACszfvMGnIe2qlr67gGDEPLlQQ6VErB20sVP/gScdYBBXlnp3zS2tGb8bpybqqWhiT9LrKz5C3e
	3WIhQv16mRexgExw0bFvyGx2fly0JaP3wMwgI2Y7lacvJskjg0hPDXci8+qhg05qefcdstOrX7+
	ZiGwKDKpUwes0F3a2NGJCxW+MIN+dKSUAP9c6ni300Np44qDIHBS8cHtV271x3Fgj457xtLkvv9
	p8ukoel4lvWQS/kxMGw4M3QR8kAJpi8FYVQl9EuQgJTOLaOg==
X-Received: by 2002:a05:6102:3a0c:b0:6ef:f691:7043 with SMTP id ada2fe7eead31-6ff0eaac5ddmr5259280137.15.1780830932360;
        Sun, 07 Jun 2026 04:15:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0c:b0:6ef:f691:7043 with SMTP id ada2fe7eead31-6ff0eaac5ddmr5259263137.15.1780830931776;
        Sun, 07 Jun 2026 04:15:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d3a1dsm38587541fa.28.2026.06.07.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:15:29 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:15:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <isuyh5tebydvld2lxolpx3ukunmzn27mx2pkamsu4wmolnnyp7@defpphasqnit>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
 <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
 <4d5e1b90-5d81-4e34-a4f1-79ef1eccc0a0@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d5e1b90-5d81-4e34-a4f1-79ef1eccc0a0@smankusors.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a2552d5 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=pxQ0L-axrEwUrt4MK4AA:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: 3dCD3KourzuV-OgtvEaRPqKhnMof-vMM
X-Proofpoint-ORIG-GUID: 3dCD3KourzuV-OgtvEaRPqKhnMof-vMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwOSBTYWx0ZWRfX6YXQZaTrFAO0
 kBZRMhsdImcoLm5sJHihYHZlGpdbGTPoYZJlYcBto53zPDClf72HaQZJd629m52QAIMvJPBt5sU
 I02Y0ZT/RXasUCUAOnxtjFsis/ytxjr+hLQBVVzPkgUZVew0DQLuXVLaP2UAb1PcOInQ9zbzRWH
 QOeuE/pUbRlhDniVaPAqquYoU6CmZ4IchGJ+WBwQ3QY0CYtK/s8LjhwckFtKsvrRmYCRsTTms5M
 EzFv+Fvqw8C/Mm9wpBPMwWguoXRCLQlKemYg4toZdLfS6qmQMWtyyWvIB5aqrexp1iGdViepA8V
 bpLStyB1DVCOWtpxoR6ItEoz7u40tXPg1INof8fIXFoW+zm3sRRGtbG3elv8xHygLsbMdiqvr9h
 V6hmvJEsPbnC9UQEa08AxX26CC1eF2QYu5XRrdfFINoyw7X52iHetIM8cQgy2XwM9iD0UKOBWjn
 wd0ff0a+O0oSgL39KmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070109

On Mon, Jun 01, 2026 at 01:36:48PM +0000, Antony Kurniawan Soemardi wrote:
> On 6/1/2026 6:38 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> > > From: Antony Kurniawan Soemardi <linux@smankusors.com>
> > > 
> > > Add support for the "qcom,rpmcc-msm8960" compatible string to the
> > > RPM clock driver.
> > > 
> > > msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> > > rpm_clk_apq8064 for this compatible.
> > > 
> > > Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> > > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> > > ---
> > >   drivers/clk/qcom/clk-rpm.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > 
> > On the other hand... You have added APQ8064 strings as a fallback. Is
> > this change really needed until you actually have SoC-specific quirks?
> 
> The fallback was recommended by Konrad in the initial review:
> https://lore.kernel.org/all/677f1d1d-a1fe-42ec-9e82-c9e504873c98@oss.qualcomm.com/
> 
> As for SoC specific quirks, I don't have anything planned right now about it
> though...

So, I think, this patch can be dropped. The entry for APQ8064 should
work already.

-- 
With best wishes
Dmitry
