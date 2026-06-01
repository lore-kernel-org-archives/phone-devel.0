Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0663603DA
	for <phone-devel@vger.kernel.org>; Mon,  1 Jun 2026 12:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315621; cv=none; b=TU9XRpHyJvNzbhi2iETI10Ye57YYq4p4yWwcEy11Y5BQAgzB4UlMPkStB8q8WN2HYprvdNvtSl32/UgTiWAJK/o+6hbBK9QtmnSbe4T0q4iRmrUwF26wZOPHQznJqGn/jDEP/9W5jIJ4agxl6fZyssFdNpXaHsUdA1SiaKWWJV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315621; c=relaxed/simple;
	bh=NMLNltHu1Nt29wgOrkX8hVRJXK1Lap2QsPGqXR5IXZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhZ6Ih4mN43THoNn2hqWc2S+9FS07LnXDN6cipBKqrCWRrq9zG3tpL2KjOJ0ZPNBx/vDM7ZyUmEY3czN1Y16xEPoMm7Ii1TiBhQvZJgcpEKYoASu4MElG5DIjtsCnvesMpqKMy8Jr/WLkFGs8j/d8GjXIRYvwT3zlyXfLjKwKc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqcpvqIj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ah3K00xD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqcpvqIj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ah3K00xD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BBCaP3128068
	for <phone-devel@vger.kernel.org>; Mon, 1 Jun 2026 12:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TYA3MtidwBDNp7NQFL7V2gHx
	CYrTzgECZO2TjVz32i8=; b=AqcpvqIjezdUXFntLA1DhaHtgdXrdShVnlSAyeZG
	UTBr3EEvyJJvfYtHHO7OZHQBUmM5TotTItb78EP9oDU0weNZHF3frbkrznD125LF
	nMDJnC7Cpzdt9Cqjk0t49DiG+1lC7VpK1ls7K8uGB8pQpuX5hx7m9NsTBvoEE7HO
	9Vm32HItpBhIDnJb+JywvP/UngAh0lf90SMSon2xMnrVe0aZ0Mqsf+aOaSb/ZqNq
	J0EMAU4s1RDnyl2VPphEDq5/aIGfXgVz6FaYlHbf8WxkOVI3nKKT+CC59y50fH1L
	/B9DDCUUrQnq5/MGiyDNzZmVUtVVbCnIlQ8+8BiDHPTe1w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh90107g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 12:06:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59f0ad4461eso1870716e0c.2
        for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 05:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780315619; x=1780920419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TYA3MtidwBDNp7NQFL7V2gHxCYrTzgECZO2TjVz32i8=;
        b=Ah3K00xDn5vfCQ4cVBnCj+xyXIKAYB5eSzexsbTCBIE/p7sH/2lDPCtCCViCJxir15
         NnQ+GYfpFOLapqhQ7QhFXU9Uo3dsfc5oZONJv+OQKzoLHpSWYjA1dNGYHrbkLd2Z7bxo
         RFAfSztSymUhhz4latke95w2AiKlddTnqog1n1JiYNy6yHvHEp+K3nbSPRG5FzqIBJfr
         G5MLlrDiQez3bje1PHCWQ0n6ZjxIsZ+hAlvvW0kIwhnVUnnW9g7uZzHmeqhqDOf6nJX9
         9RohCob+km8PO1vF/Td1waZTPpW4hJDFJYXXxAsXOZ7NOfWRCWJOJp3BNS0CnL6FpUa3
         7Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315619; x=1780920419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYA3MtidwBDNp7NQFL7V2gHxCYrTzgECZO2TjVz32i8=;
        b=rPOgy/U6ainuZiJh9OaUwLLhUJV0GjkLgm84GAFwy2at/FxygUT5oFYjUil0pLJLfu
         m/+9Mj0gyd04np75oAo21xSc90PwGx6grKgm6j4sP4+/rxOtlRNHKtXsLINy5OIeu8Bl
         o1mHhPWhd7yRxbcIHkEyAobmpA+LZ3RBJ7wkarHyA3u126bbS8hbi0mjraxIauuJQfPD
         jiP2YOeV9K4oOgNvE7oTfI6GEj9FfDfzPrDztyW94gPWwtOeAxMnMDgP/ypSQvxwYWAw
         plFq82X5Hcq9cNvgO0X63Sm7T/RULMRZfSg8GUSgpFhJH5S0eTIBsm19+Xn70CxTViKq
         zZ/g==
X-Forwarded-Encrypted: i=1; AFNElJ9O2s05wdbAJN4n3Ke1J/CGwy5OY7JWK+2qnh4S5Vvsfn+JFQGD8caiciiIAK2QXgoHib4o3ViG/VvOCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynnRMpLGw0maBEq1/aJQ7UkccN+icUS3wi2cOmnHuwX7xKY/VE
	PJ6HpYAPUHLlVmywUYu1kKlQx+1Z6XgZcONkG7jE/v8SOQImQKU6W+i7IQ4frPLu8ZmSNb/5bja
	lLthhlDzL3m76yCXk5UZcnIZfdDKwO43PHSQJDQ2H/Z5lcYrak9hCD8z1kcHqObRD5g==
X-Gm-Gg: Acq92OElRYFnNZhAsrD+0hJT+iIV5BgxCMCzJbs8RB1iRYeMge/D6/YC53VQ5vzK4/p
	smZUwKxyX73bz6uOhzcOG0BbT8Mk/tPxtuEJJud1UQaA2TQjlg3zZlQnKcIm7lxc4FE+gqe1eU3
	L79Z0WBTWz6EISg5qHB84ufsbOP6/n2CeTRpGfptokKwvdZTbtDqUj5/OocIZUSMQXt9ddyUrwB
	Ibw14VPiCfpps1/QSg2/edmiA9ddPLtr789snhwuV8ZOgczqXApp2Gemi1Tj8WWCsbMFb5Zez3A
	izGtmnwf/BmXkujMe8yg5qkWsA5IF/tEKbd2bp4hIbMEhUCLKM8DUoPkQnEO7CMgFbDD9DruP0m
	w7FxJ+5kHfC9NEdkPmgMVN6WpEo6GEK6Q+2ugCvK2BFPX4o6uBYqj0MK8TW5CivgWTCid8Vf7Ow
	V1oJBr/Ldon5CDwnYT5TzlHpCcHKuZ3L205vRxIKait/HM/A==
X-Received: by 2002:a05:6122:6093:b0:575:33d4:d101 with SMTP id 71dfb90a1353d-59beed57eb9mr4851428e0c.2.1780315618676;
        Mon, 01 Jun 2026 05:06:58 -0700 (PDT)
X-Received: by 2002:a05:6122:6093:b0:575:33d4:d101 with SMTP id 71dfb90a1353d-59beed57eb9mr4851384e0c.2.1780315618305;
        Mon, 01 Jun 2026 05:06:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793c42sm2046644e87.74.2026.06.01.05.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:06:57 -0700 (PDT)
Date: Mon, 1 Jun 2026 15:06:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
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
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
Message-ID: <a37efde6ivt5olxuiogdpniixhok4w2n4qdyj2csbnhzh635kr@j6l6ycprrepy>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1d75e3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=RM3L-PboR186kqoymW8A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: 45MiHGMOSuZ-E7NfnV5Cq3741Xs_eoAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyMSBTYWx0ZWRfX71kJ52RyugdU
 N6Oq7op+Dc3qNZ7bLrcxHpyqiw/yaApMX9zQCohcZqHMsFFZJL8VeIhE+7Ser3L85JjcSFpOcao
 8JNrY6VmUgHdavmYQ+1UzF8hDW/PUTHUptZ5ANhTuDWYcaz5DuJLnWt/DD1ehoXk25XadHWKdzu
 AMZUZhuslC+TxTImWLzVI/AaG9DtUA3DJM5YntXYTltTSuDK9KLelNpb598dZagFcjcnzmh1zaO
 EMuzgqZWiSGeqafSr4n+M31iAksZVer5rVb5HRVxakbt6n+t1kumOCLPF9yvax+sGodzOMcY6Rd
 UHrjbG+akUBZEzEKf+8KgTh+vocPpj47wNZ2qFu6mBtrXlBZgilyV+oD8RfdZPqXCO4jJho/Aoy
 A++NbbD0Eb988WHBvgNpgxH/J8L+AXF4RcpgA+RYzsgmiRJuE56ozGHI7YVZRX+1QLao8ydessG
 07mhajBX19qmk0IK+MA==
X-Proofpoint-GUID: 45MiHGMOSuZ-E7NfnV5Cq3741Xs_eoAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010121

On Mon, Jun 01, 2026 at 03:51:18PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
> 
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
> 
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
> 
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 

Please make sure that the DT matches the USB controller schema.
Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
